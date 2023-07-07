.\View-StoppedService.ps1 | 
 Select-Object -Property DisplayName,MachineName,Status,ServiceType | 
 where-object -property Name -like "*xbox*"
 ::
.\View-StoppedService.ps1 | 
 Select-Object -Property DisplayName,MachineName,Status,ServiceType | 
 where-object -property DisplayName -like "*xbox*"
::
cls
 #The End
 