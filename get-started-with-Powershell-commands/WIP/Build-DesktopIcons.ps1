# This script will create a desktop shortcut for Windows PowerShell in the Lab environment.
# Icons will be removed from the desktop as well

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$home\Desktop\Windows PowerShell.lnk")
$shortcut.TargetPath = $shell.ExpandEnvironmentStrings("%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe")
$shortcut.Save()

Remove-Item -Path "$home\Desktop\Pwsh 7.lnk" -Force
$PowerShellShortcut = $shell.shortcut("$home\Desktop\PowerShell 7.lnk")
$PowerShellShortcut.TargetPath = "c:\Program Files\PowerShell\7\pwsh.exe"
$PowerShellShortcut.Save()

