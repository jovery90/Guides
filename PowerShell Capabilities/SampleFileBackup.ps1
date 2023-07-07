# Backup files to BackupDirPath

Param(
  [string]TargetDirPath,
  [string]BackupDirPath
)

$ErrorActionPreference = "Stop"

Write-Output "`nRemoving old backups"
# Create folder if it doesn't exist
New-Item -ItemType Directory -Path $BackupDirPath -Force
Remove-Item "BackupDirPath\*" -Recurse - Force

Write-Output "`nBacking-up $TargetDirPath"
Copy-Item "$TargetDirPath" -Destination $BackupDirPath -Recurse -Force
