## Challenge Description

## Documentation Link

## Open Consoles

## Scenario and Observable Completion

## Demo: Researching Commands with Get-Command
    # Run these commands in Windows PowerShell console as Administrator

    # Exploring get-command
    Help get-command 
    Help Get-Command -examples
    # Enter Ctrl + C to break out of get-command results

# View all commands with the Verb New
    get-command -verb New
    get-command -CommandType Function | measure-object

# Use get-command to find cmdlet for IP Address Configurations on a Windows System
    get-command -name *IP* | More
    gcm -Name Get*IP* | more
    gcm -Name Get*IPaddress* | more
    help Get-NetIPAddress -Examples
    Get-NetIPAddress | Format-Table
    gcm -Name *alias
    help new-alias -Examples
    new-alias -Name IP -Value Get-NetIPAddress
    Ip | Format-Table