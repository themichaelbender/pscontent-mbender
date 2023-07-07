# Demo: Working with Files and Directories
# Run these commands in Windows PowerShell console as Administrator

# Searching the Windows File system for .PNG files
help Get-ChildItem -Examples
cls 
Get-ChildItem -path c:\windows\web
    cls
    Get-ChildItem -Path c:\windows\web -name
    cls
    Get-ChildItem -Path c:\windows\web -Recurse 
    cls
    Get-childitem -path c:\windows\web -name -recurse
    cls
    dir -path c:\windows \web -recurse -name
    cls
    ls -path c:\windows\web -Include *.jpg -name -recurse 
    cls
    (ls -path c:\windows\web -Include *.jpg -recurse -name).count
    cls

    # Create Files and folders
    New-Item -ItemType File -Path .\NewFiles01\JustaFile.txt
    New-Item -ItemType Directory .\NewFiles01
    cls
    New-Item -ItemType File -Path .\NewFiles01\JustaFile.txt
    notepad .\NewFiles01\JustaFile.txt
    cls
    new-item -ItemType Directory -Path .\MovedFolder
    mkdir -Path .\mkdir01
    $Function:Mkdir
    cls
    md -Path .\md01 
    ls 
    cls 
   # Copying Files
    Get-Command *copy*
    cls
    copy-item -path c:\windows\web -Destination .\CopiedFolder -Recurse -Verbose
    cls
    ls .\CopiedFolder
    cls
    dir .\CopiedFolder -recurse
    cls
    set-location .\CopiedFolder\4K
    ls
    cd ..
    ls
    cls
    get-location
    cls
    

# Moving files

    move-item .\CopiedFolder -Destination .\MovedFolder -verbose
    dir .\MovedFolder -Recurse
    cls
    Rename-Item .\MovedFolder -NewName .\RenamedFolder
    cd .\RenamedFolder
    ls
