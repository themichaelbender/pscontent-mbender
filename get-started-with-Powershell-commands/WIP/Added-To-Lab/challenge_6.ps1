## Challenge Description

## Documentation Link

## Open Consoles

## Scenario and Observable Completion

#Demo - Pipelining and Objects
#Get all the services on the computer
$Computername = "LocalHost"
Get-Service -ComputerName LocalHost

#Get the properties for the services on the computer
Get-Service -ComputerName LocalHost | Get-Member

#Get the properties of interest for the services on the computer
Get-Service -ComputerName LocalHost | select-object -Property Name,Status 

#Get the properties of interest for the services on the computer
Get-Service -ComputerName LocalHost | Select-Object -Property Name,Status | gm

#Get the services that are stopped
Get-Service -ComputerName LocalHost | where-object -Property status -eq "Stopped" | More 

#Get the properties of interest for the services that are stopped
Get-Service -ComputerName LocalHost | where-object -Property status -eq "Stopped" | GM

#Get the properties of interest for the services that are stopped
Get-Service -ComputerName LocalHost |
where-object status -eq "Stopped" |
Select-Object Name,Status | More

#Get the number of services that are stopped
(Get-Service -ComputerName LocalHost | where-object status -eq "Stopped" | Select-Object Name,Status).count