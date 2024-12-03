# Define the URL for the Notepad++ installer
$installerUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.Installer.x64.exe"

# Define the path to save the installer
$installerPath = Join-Path $env:TEMP (Split-Path $installerUrl -Leaf)

# Download the installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the installer silently
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Check if the installation was successful by confirming the executable exists in the default install directory
if (Test-Path "C:\Program Files\Notepad++\notepad++.exe") {
    Write-Output "Notepad++ installed successfully."
} else {
    Write-Output "Notepad++ installation failed."
}
