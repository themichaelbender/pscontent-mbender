 #Basic script to view stopped services on a system
# Runs only in Windows PowerShell due to -ComputerName parameter
$Computername = Read-host 'Enter name of host'

$StoppedService = get-service -ComputerName $Computername   |
                         Where-Object -Property Status -eq 'Stopped'

Write-Output $StoppedService
