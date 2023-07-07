Get-Variable | more
cls
Get-Variable -Name P*
cls
$PSVersionTable
cls
Get-ChildItem ENV: | more
cls
$env:NUMBER_OF_PROCESSORS
$env:COMPUTERNAME

Write-Host "The name of the computer is $ENV:COMPUTERNAME"
Write-Host 'The name of the variable for the computer is $ENV:COMPUTERNAME'
Write-Host The name of the computer is $ENV:COMPUTERNAME | gm
Write-Output "The name of the compure is $ENV:COMPUTERNAME"
Write-Output "The name of the compure is $ENV:COMPUTERNAME" | gm
$Outputvar = Write-Output "The name of the compure is $ENV:COMPUTERNAME"
$Outputvar

$ServiceVar = Get-Service
$ServiceVar 
cls
$serviceVar | Where-Object -Property Status -eq "Stopped" | Select-Object -Property DisplayName,Status
cls
($servicevar).count
$OutputVar | GM
CLS

#Store Credential
$credential = Get-Credential
cls
$credential | gm
$credential

