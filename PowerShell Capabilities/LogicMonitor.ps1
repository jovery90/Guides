# Logic Monitor SDTs with PowerShell via LM's API - Server-wide SDT for services (SDT = Scheduled Down-Time)
# https://www.logicmonitor.com/support/rest-api-developers-guide/v1/sdts/update-sdts
# Requires an access ID and Key, as well as the company's name

# You can update $Type to ServiceSDT, $MonitoredService to the URL, then the $Data line replace "deviceDisplayName" with "serviceName" - for Website SDTs

$MonitoredService = "ServerName"
$SDTLength = 60 #Minutes
$SDTMessage = "SDT Generic Message"

$AccessID = 1234567
$AccessKey = 1234567889123456789
$CompanyName = "SomeCompanyName"

# STD Type (Integer)
# 1 = One Time
# 2 = Weekly SDT
# 3 = Monthly SDT
# 4 = Daily SDT
$SDTType = 1

# Type (String)
# ServiceGroupSDT, DeviceGroupSDT, CollectorSDT, DeviceSDT
$Type = "DeviceSDT"

# Request Details
$HTTPVerb = "POST"
$ResourcePath = "/sdt/sdts"

# SDT Start Date (current time)
$MaintenanceStart = (Get-Date -UFormat "%m/%d/%Y %R")

# SDT Length (in minutes)
$StartDate = (Get-Date -Date $MaintenanceStart).ToUniversalTime()
$StartDateEpoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end $StartDate).TotalMilliseconds)

$EndDate = $StartDate.AddMinutes($SDTLength)
$EndDateEpoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end $EndDate).TotalMilliseconds)

# SDT Data
$Data = '{"sdtType":'+$SDTType+',"type":"'+ $Type +'","deviceDisplayName":"'+$MonitoredService+'","startDateTime":'+$StartDateEpoch +',"$endDateTime":'+ $EndDateEpoch +',"comment":"'+$SDTMessage+'"}'

# Construct URL
$URL = 'https://' + $CompanyName + '.llgicmonitor.com/santaba/rest' + $ResourcePath

# Get current  time in milliseconds
$Epoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)

# Concatenate Request Details
$RequestVars = $HTTPVerb + $Epoch + $Data + $ResourcePath

# Construct Signature
$HMAC = New-Object System.Security.Cryptography.HMACSHA256
$HMAC.Key = [Text.Encoding]..UTF8.GetBytes($AccessKey)
$SignatureBytes = $HMAC.ComputeHash([Text.Encoding]::UTF8.GetBytes($RequestVars))
$SignatureHex = [System.BitConverter]::ToString($SignatureBytes) -replace '-'
$Signature = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($signatureHex.ToLower()))

# Construct Headers
$Auth = 'LMv1' + $AccessID + ':' + $Signature + ':' + $Epoch
$Headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$Headers.Add("Authorization",$Auth)
$Headers.Add("Content-Type",'application/json')

# Make Request
$Responce = Invoke-RestMethod -Uri $URL -Method $HTTPVerb -Body $Data -Header $Headers

# Print status and body of response
$Status = $Responce.status
$Body = $Responce.data| ConvertTo-Json -Depth 5

# Write Query:$Response
Write-Output "Stauts:$Status"
Write-Output "Response:$Body"
