## Challenge Description

## Documentation Link

## Open Consoles

## Scenario and Observable Completion

# Demo: Finding Your Way in PowerShell
    # Run these commands in Windows PowerShell console as Administrator
    
    # Using get-command to find cmdlet for Windows Firewall
    get-command -Name *Fire*
    get-command -Name get-*Fire*
    get-command -Name get-NetFire*
    help Get-NetFirewallRule

# Using get-member (alias gm) expose objects
    Get-NetFirewallRule | gm
    Get-NetFirewallRule

# Retrieve Firewall rules for Remote Desktop
    Get-NetFirewallRule -Name *Remote* 
    Get-NetFirewallRule -Name *RemoteDesktop* 
    Get-NetFirewallRule -Name *RemoteDesktop* | FT

# Use pipeline to set Firewall rule
    Get-NetFirewallRule -Name *RemoteDesktop* | Set-NetFirewallRule -Enabled 'True' -Whatif
    Get-NetFirewallRule -Name *RemoteDesktop* | FT