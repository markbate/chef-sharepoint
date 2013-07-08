DOWNLOAD_URL = "http://download.microsoft.com/download/3/E/8/3E85BC6B-6024-459E-8415-0ED8A21DD11A/sharepoint.exe"

windows_package "sharepoint" do
  source DOWNLOAD_URL
  action :install
end