help Get-ComputerInfo -examples 
cls
Get-ComputerInfo
cls
Get-ComputerInfo | gm
cls
Get-ComputerInfo -Property OS*
cls
Get-ComputerInfo | Format-Table -Property OsBuildNumber,WindowsEditionId,CsNumberOfProcessors,CsNumberOfLogicalProcessors 
cls
Get-ComputerInfo | Format-List -Property OsBuildNumber,WindowsEditionId,CsNumberOfProcessors,CsNumberOfLogicalProcessors
cls