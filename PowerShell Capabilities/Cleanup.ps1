# Cleanup.ps1 will remove all files from specified directory
# $FolderPath = Full file path.  $Days = Number of days used as buffer of file history to delete

Param(
[$string]$FolderPath,
[int]$Days
)

$EndDate = (Get-Date).AddDays(-$Days)

Get-ChildItem -Path $FolderPath -File | Where-Object { $_.LastWriteTime -lt $EndDate } | Remove-Item -Force -Verbose
