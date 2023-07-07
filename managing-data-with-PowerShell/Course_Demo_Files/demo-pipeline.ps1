#Demo - Pipelining and Objects
get-service
cls
Get-service | Get-Member
cls
Get-service | select-object -Property Name,Status 
cls
Get-Service | Select-Object -Property Name,Status | gm
cls
get-service | where-object -Property status -eq "Stopped" | More 
cls
get-service | where-object -Property status -eq "Stopped" | GM
cls
::
get-service |
where-object status -eq "Stopped" |
Select-Object Name,Status | More
::
cls
(get-service | where-object status -eq "Stopped" | Select-Object Name,Status).count


