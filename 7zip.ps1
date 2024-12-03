# Define the URL for the 7-Zip installer
$installerUrl = "https://www.7-zip.org/a/7z2409-x64.exe"

# Define the path to save the installer
$installerPath = Join-Path $env:TEMP (Split-Path $installerUrl -Leaf)

# Download the installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the installer silently
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Check if the installation was successful by confirming the executable exists in the default install directory
if (Test-Path "C:\Program Files\7-Zip\7z.exe") {
    Write-Output "7-Zip installed successfully."
} else {
    Write-Output "7-Zip installation failed."
}
