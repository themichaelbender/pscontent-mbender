get-command -Name *Fire*
cls
get-command -Name get-*Fire*
cls
help Get-NetFirewallRule -Examples  
cls
Get-NetFirewallRule | gm
cls
Get-NetFirewallRule
cls
Get-NetFirewallRule -Name *Remote* 
cls
Get-NetFirewallRule -Name *RemoteDesktop* 
cls
Get-NetFirewallRule -Name *RemoteDesktop* | FT
cls
Get-NetFirewallRule -Name *RemoteDesktop* | Set-NetFirewallRule -Enabled 'True' -Whatif
cls
Get-NetFirewallRule -Name *RemoteDesktop* | FT
