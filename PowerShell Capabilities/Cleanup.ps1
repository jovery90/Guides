# Cleanup.ps1 will remove all files from specified directory (this version doesn't check folders, see Reference for other options)
# $FolderPath = Full file path.  $Days = Number of days used as buffer of file history to delete
# Reference:  https://www.thomasmaurer.ch/2010/12/powershell-delete-files-older-than/

Param(
[$string]$FolderPath,
[int]$Days
)

$EndDate = (Get-Date).AddDays(-$Days)

Get-ChildItem -Path $FolderPath -File | Where-Object { $_.LastWriteTime -lt $EndDate } | Remove-Item -Force -Verbose
