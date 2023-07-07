# Check status and start-up type of Windows service

# Check running status of service -Name is the "Display Name"
$Service = Get-Service -Name "Service Name" -ComputerName "Server Name"
Write-Output "Service state is: $Service.Status"
Write-Output "Service startup type is: $Service.StartType"


# Setting startup type, requires "Service Name"
# Obtaining "Service Name", with just "Display Name" known
$ServiceName = $Service.name

# Set startup type, older PowerShell >=5.1 just has "Manual", "Automatic", and "Disabled" as well as "Boot" and "System", newer has "AutomaticDelatedStart"
Set-Service -Name $ServiceName -StartupType "Automatic" -ComputerName "Server Name"
