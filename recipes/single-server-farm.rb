download_url = "http://care.dlservice.microsoft.com//dl/download/3/D/7/3D713F30-C316-49B8-9CC0-E1BFC34B63A0/SharePointServer_x64_en-us.img"
download_to = "C:/Users/#{ENV['USERNAME']}/Downloads/SharePointServer_x64_en-us.img"
node.override['sharepoint']['server_role'] = "SINGLESERVER"

remote_file download_to do
  source download_url
end

# mount the image as a drive. Powershell doesn't appear to let us define a
# drive letter, so I'm throwing it back to chef via an env var. super hacky!
powershell "mount SPS image" do
  code <<-EOH
  $mountResult = Mount-DiskImage -PassThru -ImagePath "#{download_to}"
  $driveLetter = ($mountResult | Get-Volume).DriveLetter
  [Environment]::SetEnvironmentVariable("SPS_Mount", $driveLetter, "User")
  EOH
end

# create the config file
template "C:/Windows/Temp/sharepoint-config.xml" do
  source "config.xml.erb"
  rights :read, "Everyone"
end

# run the prereq installer. not sure, but this might need to restart things.
# if it does, then obviously it'll break the connection. silly windows.
windows_package "sharepoint preparation" do
  source "#{ENV['SPS_Mount']}:/prerequisiteinstaller.exe"
  action :install
  options "/unattended"
end

# install sharepoint
windows_package "sharepoint" do
  source "#{ENV['SPS_Mount']}:/setup.exe"
  action :install
  options "/config C:/Windows/Temp/sharepoint-config.xml"
end

# configuration stuff would go here

