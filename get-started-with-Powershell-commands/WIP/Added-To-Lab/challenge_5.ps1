## Challenge Description

## Documentation Link

## Open Consoles

## Scenario and Observable Completion

# Demo: Finding Object Properties with Get-Member
    # Run these commands in Windows PowerShell console as Administrator

    # Explore Get-member cmdlet
    Help Get-Member
    Get-service | Get-Member

# Viewing objects for get-service
# Add -computername to commands ?
    Get-service | Select-Object Name,MachineName,Status
    Get-Service | Select-Object Name,MachineName,Status | Get-Member
    Get-Service | Where-Object status -eq "Stopped" | More

# Putting all the commands together
# Note: The video demo runs each command below line by line.
# To issue commands, type each line and issue 'Enter' after each pipe symbol.
    Get-Service -ComputerName Client01,DC01 |
    Where-Object status -eq "Stopped" |
    Select-Object Name,MachineName,Status |
    Sort-Object -Property MachineName | More