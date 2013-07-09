download_url = "http://download.microsoft.com/download/3/E/8/3E85BC6B-6024-459E-8415-0ED8A21DD11A/sharepoint.exe"
node.override['sharepoint']['server_role'] = "APPLICATION"

# create the config file
template "C:/Windows/Temp/sharepoint-config.xml" do
  source "config.xml.erb"
  rights :read, "Everyone"
end

# install sharepoint
windows_package "sharepoint" do
  source download_url
  action :install
  options "/config C:/Windows/Temp/sharepoint-config.xml"
end
