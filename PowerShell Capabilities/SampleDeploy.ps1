# Overwrite files from $Source to $Target

Param(
  [string]$Source,
  [string]$Target
)

$ErrorActionPreference = "Stop"

Write-Output "Starting copy"

# Create dir if if doesn't exist yet
New-Item -ItemType Directory -Path $Target -Force

# Remove old files
Remove-Item "$Target\*" -Recurse -Force

# File copy
Copy-Item "$Source\*" -Destination "$Target" -Recurse -Force
