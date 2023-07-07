# Intent is that whatever is running this script has rights to restart a server (Azure Agent installed on machine is my normal go-to)

Param(
  [string]$Server
)

Write-Output "Restarting $Server"
Restart-Computer -ComputerName $Server -Force
