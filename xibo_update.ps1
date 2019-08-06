$uri = 'https://xibo.org.uk/api/downloads/windows'
$path = 'C:\xibo\latestInstaller.msi'

# Set TLS level to 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Download and install latest player
Invoke-WebRequest -Uri $uri -OutFile $path
msiexec -package $path -quiet

# Stop current xibo processes and start new player
Stop-Process -Name XiboClient* -Force
Start-Process 'C:\Program Files (x86)\Xibo Player\XiboClient.exe'
