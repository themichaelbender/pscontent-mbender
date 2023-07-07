# Challenge 2 - Configure the PowerShell console 

## Challenge Description

## Documentation Link

## Open Consoles

## Scenario and Observable Completion

# Open as Administrator through gui

# Check version
$PSVersionTable

Clear-host or cls

# Configure Windows PowerShell
# Change Font Size
Right-click title bar.
Choose Properties.
Select Options tab and check 'Use Ctrl+Shift+C/V as Copy/Paste'
Choose properties and change font size to 24, or whatever you prefer.
Click OK.

# Configure PowerShell 7 

right-click 'PowerShell 7 Icon' on desktop and choose 'run as administrator'
Right-click title bar.
Choose Properties.
Select Options tab and check 'Use Ctrl+Shift+C/V as Copy/Paste'
Choose properties and change font size to 24, or whatever you prefer.
Click OK.

# Run Commands in CMD

# Update Help

# Module - Introduction to PowerShell
# Demo: Using PowerShell to Report on Stopped Server Services
    # Run these commands in Windows PowerShell console as Administrator
    # Open Windows PowerShell
    # Right-click on choose 'Run as administrator' on desktop icon

    # View all services on local system                                                                                                                         
    Get-Service

    # View stopped services
        get-service | where-Object Status -eq 'Stopped'

    # View only Name and Status for stopped services                                                  
        get-service | Where-Object Status -eq 'Stopped' | select-object Name,Status 

    # Place command output in a variable
        $data = get-service | Where-Object Status -eq 'Stopped' | select-object Name,Status 
        $data

    # Note the difference between the output files of the two commands below
    # Output variable data to a .csv file
    # View in notepad or VS Code
        $data | out-file .\services.csv                  
        notepad .\services.csv                                                                                               
        code .\services.csv

    # Export variable data to a .csv file
        $data | export-csv .\Services2.csv   
        get-content .\services2.csv | more  

    # Import data from a .csv file
        $ImportData = import-csv .\services2.csv
        $ImportData
# Demo: Exploring PowerShell Verbs
    # Run these commands in PowerShell 7 console
    #In the console window, type the following command to list all of the verbs available in the Windows PowerShell console, and click the space bar to scroll through each screen
        get-verb | more
            #The command includes | more so all of the output can be reviewed one screen at a time. If you need to exit the output, you can use Ctrl+C to go to the prompt.

    #Type the following command to view all of the commands in PowerShell using the Set verb.
        get-verb -Verb Set | more
            #In the command output, you will see the default formatting of output is as a table.

    #Type the following command to view all of the commands in PowerShell using the set verb and in a list format.
        get-verb -Verb Set | format-list
            #In this command, you pipe "|" the output of the command into format-list to display the output as a list. 

    #Type the following command to view all of the verbs that are part of the Security group.
        Get-Verb -Group Security | Format-List
            #The -group parameter is only available in PowerShell 7 so it will not work if you are using Windows PowerShell.

    #Type Exit to close the PowerShell 7 console, or leave it open if you plan to do the next challenge.
        Exit

    # View Approved Verbs for Powershell doc at docs.microsoft.com.
    # Try https://bit.ly/psverbs
    # This will not work in lab environment due to Internet access restrictions.
    # Launch URL above in a separate browser window