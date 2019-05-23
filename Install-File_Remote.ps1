#This script is intended to solve the double hop issue with powershell
#It copies files from local to server side then executes.

#csv for hostnames
$clients  = import-csv C:\Users\User\Scripts\Powershell\Hostnames_test.csv

#build hostname "$client" object to be passed via invoke-command

foreach($pc in $clients)
{
   $client = $pc.Name

   #Copy bat file and exe from local to server side

   Copy-Item –Path C:\Users\User\Scripts\Powershell\HelloWorld_Install.bat –Destination \\$client\c$\temp\
   Copy-Item –Path C:\Users\User\Scripts\Powershell\HelloWorld.exe –Destination \\$client\c$\temp\

   #invoke serverside command to install batch file.
   Invoke-Command -ComputerName $client -ScriptBlock {Invoke-Expression -Command:"cmd.exe /c 'C:\\temp\HelloWorld.bat'" }
}

#Done like dinner.
