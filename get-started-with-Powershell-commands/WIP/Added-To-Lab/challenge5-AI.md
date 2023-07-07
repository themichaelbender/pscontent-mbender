Title: Investigating Commands with Get-Member in PowerShell

Introduction:
PowerShell is a versatile scripting language and command-line shell that enables users to automate tasks and manage Windows systems efficiently. In this article, we will explore the Get-Member cmdlet, which allows us to investigate the properties and methods of objects in PowerShell. By using Get-Member, we can gain insights into the structure and capabilities of different objects, empowering us to work more effectively with PowerShell. Let's dive into the step-by-step instructions to understand how Get-Member can be used to explore objects in PowerShell.

Understanding Get-Member
- Open the Windows PowerShell console as an administrator.
- To get help on the Get-Member cmdlet, type: `Help Get-Member`
- Review the information provided to understand the purpose and usage of Get-Member.
- See examples of how Get-Member can be used, type: `Get-service | Get-Member`
- Examine the output to understand the properties and methods available for the "Service" object.

Step 2: Viewing Objects for Get-Service
- To retrieve a list of services and select specific properties, type: `Get-service | Select-Object Name,MachineName,Status`
- Observe the output that displays the name, machine name, and status of each service.
- To investigate the properties and methods of the selected objects, type: `Get-Service | Select-Object Name,MachineName,Status | Get-Member`
- Examine the output to understand the available properties and methods for the selected objects.
- To filter the list of services and display only the ones that are stopped, type: `Get-Service | Where-Object status -eq "Stopped" | More`
- Scroll through the list using the Enter key, and press Ctrl + C to exit.

Step 3: Putting All the Commands Together
- Note: The following commands are demonstrated in a video where each line is executed separately.
- To issue the commands, type each line and press Enter after each pipe symbol.
- Start by fetching services from specific computers: `Get-Service -ComputerName Client01,DC01 |`
- Filter the list to display only the stopped services: `Where-Object status -eq "Stopped" |`
- Select specific properties for display: `Select-Object Name,MachineName,Status |`
- Sort the results based on the machine name: `Sort-Object -Property MachineName | More`
- Scroll through the sorted list using the Enter key, and press Ctrl + C to exit.

Conclusion:
In this article, we have explored the Get-Member cmdlet in PowerShell, which allows us to investigate the properties and methods of objects. By using Get-Member, we can gain insights into the structure and capabilities of different objects, enabling us to work more effectively with PowerShell. We have learned how to use Get-Member to explore the properties and methods of objects such as services. With practice, you can become proficient in using Get-Member and leverage its power to understand and manipulate objects in PowerShell.