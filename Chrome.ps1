# Define the URL for the Google Chrome installer
$installerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"

# Define the path to save the installer
$installerPath = Join-Path $env:TEMP (Split-Path $installerUrl -Leaf)

# Download the installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the installer silently
Start-Process -FilePath $installerPath -ArgumentList "/silent", "/install" -Wait

# Check if the installation was successful by confirming the executable exists in the default install directory
if (Test-Path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe") {
    Write-Output "Google Chrome installed successfully."
} else {
    Write-Output "Google Chrome installation failed."
}
