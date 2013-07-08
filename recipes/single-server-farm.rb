DOWNLOAD_URL = "http://care.dlservice.microsoft.com//dl/download/3/D/7/3D713F30-C316-49B8-9CC0-E1BFC34B63A0/SharePointServer_x64_en-us.img"

node.override['sharepoint']['server_role'] = "SINGLESERVER"

remote_file "sharepoint image" do
  # map this to the DOWNLOAD_URL
end





template "c:\temp\sharepoint-config.xml" do
  source "config.xml.erb"
  rights :read, "Everyone"
end

windows_package "sharepoint preparation" do
  
  action :install
end

windows_package "sharepoint" do
  source DOWNLOAD_URL
  action :install
  options "/config c:\temp\sharepoint-config.xml"
end
