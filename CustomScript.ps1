#Script to Create or Append content to File
$folder = "c:\temp"
$log = "c:\temp\AzureLog.txt"
$date = get-date

if (!(Test-Path $log)) {
    New-Item -Path $folder -ItemType Directory
    New-Item -Path $log -ItemType File
    Add-Content -Value "NEW LOG: Azure PowerShell Endpoint - $date" -Path $log
}
else {
    Add-Content -Value "EXSISITNG LOG: Azure PowerShell Endpoint - $date" -Path $log
}

#Script to install IIS on VM
Install-WindowsFeature Web-Server

#Install the .NET Core Windows Server Hosting bundle: 
Invoke-WebRequest https://download.visualstudio.microsoft.com/download/pr/f206c2cc-a062-4e26-90ae-7647450de9e1/c4e5b1e0a32613215d998f2bdef12a9c/dotnet-sdk-6.0.406-win-arm64.exe 
Start-Process $env:temp\dotnet-sdk-6.0.406-win-arm64.exe -ArgumentList '/quiet' -Wait
