# Stopping a windows service, and killing processes

Write-Output "Stopping service"
(gwmi win32_service -ComputerName "Server Name" -Filter "DisplayName='Service Display Name'").StopService()

# Killing processes 
$RunningProcesses = Get-WmiObject -Class Win32_Process -ComputerName "Server Name" -Filter "name='Service's exectuable name'"
if($RunningProccesses) {
  foreach($Process in $RunningProcesses){
    $ReturnVal = $Process.terminate()
    $ProcessID = $Process.handle
    if(ReturnVal.returnvalue -eq 0) {
      Write-Output "`nKilled $ProcessID"
    }
    else {
      Write-Output "Could not kill $ProcessID"
    }
  }
}

# You can then check state, as service should've crashed after killing PIDs
