#this will loop thru a text file for hostnames and uninstall a program called "HelloWorld"
Invoke-Command -Credential DOMAIN\ -ComputerName (Get-Content C:\users\sr182801\documents\scripts\Powershell\computernames.txt) -ScriptBlock {Get-CimInstance -ClassName Win32_Product -Filter "name like '%HelloWorldt%'" | Invoke-CimMethod -MethodName Uninstall}
