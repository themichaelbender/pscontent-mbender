help get-content -examples 
cls
1..100 | ForEach-Object { Add-Content -Path .\LineNumbers.txt -Value "This is line $_." }

Get-Content -Path .\LineNumbers.txt
cls
Get-Content -Path .\LineNumbers.txt -TotalCount 5
cls
Get-Item -Path .\LineNumbers.txt | Get-Content -Tail 5
cls
Get-Content -Path .\LineNumbers.txt | Set-Content -Path .\LineNumbersv2.txt
get-content -Path .\LineNumbersv2.txt
cls
get-service | out-file demo.csv
get-content demo.csv
cls
notepad demo.csv
cls
get-service | export-csv demo2.csv
notepad demo2.csv
cls
import-csv demo2.csv | where-object -property Name -like "*xbox*" | format-table Name,Description
cls

