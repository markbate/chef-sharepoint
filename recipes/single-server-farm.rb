download_url = "http://care.dlservice.microsoft.com//dl/download/3/D/7/3D713F30-C316-49B8-9CC0-E1BFC34B63A0/SharePointServer_x64_en-us.img"

node.override['sharepoint']['server_role'] = "SINGLESERVER"


template "C:\\Windows\Temp\\sharepoint-config.xml" do
  source "config.xml.erb"
  rights :read, "Everyone"
end

windows_package "sharepoint preparation" do
  source "F:\\prerequisiteinstaller.exe"
  action :install
  options "/unattended"
end

windows_package "sharepoint" do
  source "F:\\setup.exe"
  action :install
  options "/config C:\\Windows\Temp\\sharepoint-config.xml"
end
