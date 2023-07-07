Article: Investigating Commands with Get-Member in PowerShell

Introduction:
PowerShell provides a powerful feature called Get-Member, which allows us to investigate the properties and methods of objects. By using Get-Member, we can explore the structure and capabilities of different commands, helping us better understand how to work with them. In this article, we will learn how to use Get-Member step-by-step to investigate commands and their objects in PowerShell. So, let's dive in!

Step 1: Exploring Get-Member
To begin our exploration, let's understand how to use the Get-Member cmdlet. This cmdlet provides us with information about the properties and methods of objects. To access the detailed help information for Get-Member, enter the following command in your PowerShell console:

```powershell
Help Get-Member
```

This will display the comprehensive help information, explaining the usage and functionality of the Get-Member cmdlet. Make sure to read through it to gain a better understanding.

Next, let's apply Get-Member to a practical example. We can use the Get-Service command, which retrieves information about services on our system, to investigate its objects. Execute the following command:

```powershell
Get-Service | Get-Member
```

This command will display the properties and methods associated with the objects returned by Get-Service. It allows us to examine the available information and operations we can perform on the service objects.

Step 2: Viewing Objects for Get-Service
In this step, we will focus on retrieving specific information from the Get-Service command and explore the objects it returns. Let's start by displaying a few selected properties for the services. Enter the following command:

```powershell
Get-Service | Select-Object Name, MachineName, Status
```

By using the Select-Object cmdlet, we can choose the properties we want to see, such as Name, MachineName, and Status. This command will present a list of services along with their corresponding values for the selected properties.

Now, let's investigate the objects returned by the Get-Service command in more detail. Execute the following command:

```powershell
Get-Service | Select-Object Name, MachineName, Status | Get-Member
```

This command combines Get-Service, Select-Object, and Get-Member to provide us with the properties and methods of the service objects. By examining this output, we can better understand the available information and actions we can perform on the service objects.

Additionally, if you want to filter the services based on a specific condition, such as only displaying stopped services, you can use the Where-Object cmdlet. Enter the following command:

```powershell
Get-Service | Where-Object Status -eq "Stopped" | More
```

This command filters the services using the Where-Object cmdlet, specifying the condition that the Status property should be equal to "Stopped." The resulting services are then displayed using the More command, which allows scrolling through the output.

Step 3: Putting it All Together
In this final step, we will combine the commands we've learned so far to investigate services on specific computers and sort the results. Enter the following command:

```powershell
Get-Service -ComputerName Client01, DC01 |
Where-Object Status -eq "Stopped" |
Select-Object Name, MachineName, Status |
Sort-Object -Property MachineName | More
```

This command retrieves services from the specified computers (Client01 and DC01), filters only the stopped services, selects the Name, MachineName, and Status properties, sorts the results based on the MachineName, and displays the output using the More command for easy scrolling.

Conclusion:
Using the Get-Member cmdlet in PowerShell

 allows us to investigate the properties and methods of objects returned by different commands. By exploring these objects, we gain a better understanding of how to work with them effectively. In this article, we learned how to use Get-Member step-by-step, examined objects returned by Get-Service, retrieved specific information, and combined multiple commands to investigate services on specific computers. By applying these techniques, we can expand our PowerShell knowledge and enhance our ability to interact with commands and their objects. Keep practicing and exploring to become proficient in PowerShell!