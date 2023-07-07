Details section action items for you (or questions :smile: )
**Lab description, it's repetitive and unnecessarily long. Please slim it down. Happy to help! Can just use the description from the outline instead**
**Prerequisites, is networking, even a basic understanding, needed in this lab?**
ch 2 action items for you (please ask if you have any questions!)
**Remove In this challenge from the Challenge description, and avoid for future chs
It's redundant and unneeded. Happy to help reword a bit too if you want, if the removal leaves it too terse.**
In the first par., mention the associated course and link to it
Update the first Note, as the lab doesn't take 20 min to spin up
Updating PowerShell help files step 1, right-click Windows Powershell icon and choose Run as administrator option. :arrow_right: right-click the pwsh 7 icon and choose the Run as administrator option. Click Yes when prompted.
Updating PowerShell help files step 2,
In the Windows PowerShell console, :arrow_right: In the Administrator: pwsh 7 console,
imo, fine to just say In the PowerShell console, or even avoid the where in this case and just start with Enter the following command
update-help -SourcePath "c:\users\administrator\desktop\Lab_Files\pshelp" :arrow_right:  update-help -SourcePath "C:\Users\Public\Desktop\LAB_FILES\LAB_FILES\pshelp" -Module Microsoft.PowerShell*
definitely fix the path, current one is incorrect, but use your discretion on the -Module bit. It is quicker, and it seems to work, but I haven't tested it thoroughly
Note, too, I move the command up into this step, instead of after. You can add a new paragraphs within a bullet using shift+enter
Updating PowerShell help files Note
Powershell :arrow_right: PowerShell
we've provided you the files locally. :arrow_right: the files were provided locally.
Configuring the Windows PowerShell console, remove this section as it's not relevant
Configuring the PowerShell 7 console
step 1, In the Windows PowerShell console :arrow_right: In the Administrator: pwsh 7 console
step 3, Right-click title bar of the  console :arrow_right: Right-click the title bar of the console
step 4, Select Options tab and :arrow_right: In the Options tab,
step 5, Choose Properties and change font size to 24, :arrow_right: Select the Font tab, and change the font Size to 24, or whatever you prefer.
step 6, Some good options are the changing items on the Colors tab along with the Buffer size on the Layout tab. :arrow_right: Some good options are in the Colors tab, along with the Buffer Size in the Layout tab.
final paragraph, You have a fully functional PowerShell environment with updated help and configured as you see fit. :arrow_right: You have a fully functional PowerShell environment with updated help, and that is configured as you see fit.
I moved this after the final bulleted list
There is no final outcome, as it's not needed here imo, but normally have one (and/or have sporadic interspersed images or descriptions of how things should appear, or output, so learners know they're doing things correctly)
Note I'll normally make most of the :arrow_up: changes myself as they're minor, and will do so for later chs (challenges). If you have any questions, too -- it's tough to convey changes sans markdown-based and githubed content -- please let me know!