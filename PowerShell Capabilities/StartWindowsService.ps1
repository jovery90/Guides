# Script example of starting a Windows service

Write-Output "Starting service"
(gwi win32_service -ComputerName "SomeComputerName" -Filter "DisplayName='SomeServiceDisplayName;").StartService()

#Service takes a moment to start, recommend a "Start-Sleep -s 10" for 10 second pause, or service state check
