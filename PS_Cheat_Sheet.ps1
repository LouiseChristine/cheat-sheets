# PI.ps1
$PI = 3.14
Write-Host "The value of `$PI is $PI"

$PI = 3.14
Write-Host 'Here is $PI' # Prints Here is $PI
Write-Host "Here is `$PI and its value is $PI" # Prints Here is $PI and its value is 3.14
Write-Host "An expression $($PI + 1)" # Prints An expression 4.14

$test = 'hi'
Write-Host $test # Prints hi

$Profile | Select-Object * #shows profiles i guess

## Declare and use a parameter ##

# CreateFile.ps1
Param (
  $Path
)
New-Item $Path # Creates a new file at $Path.
Write-Host "File $Path was created"

./CreateFile.ps1 -Path './newfile.txt' # File ./newfile.txt was created.
./CreateFile.ps1 -Path './anotherfile.txt' # File ./anotherfile.txt was created.

## IF/ELSE ##

Param(
   $Path
)
If (-Not $Path -eq '') {
   New-Item $Path
   Write-Host "File created at path $Path"
} Else {
   Write-Error "Path cannot be empty"
} 

#################################
Param (
  $Path
)


#./CreateFile.ps1 -Path './newfile.txt' # File ./newfile.txt was created.
$Path = 'newfile.txt'

New-Item $Path # Creates a new file at $Path.
Write-Host "File $Path was created"
####################################
Param(
   $Path= 'newfile1.txt'
)
If (-Not $Path -eq '') {
   New-Item $Path
   Write-Host "File created at path $Path"
} Else {
   Write-Error "Path cannot be empty"
} 
####################################
##Takes input path
Param(
   [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
   $Path= 'newfile1.txt'
)
New-Item $Path
Write-Host "File created at path $Path"
###################################
####creating backups 

<#mkdir app
cd app
touch index.html app.js
cd ..

touch Backup.ps1
code Backup.ps1 #>

mkdir app
cd app
New-item index.html,app.js
cd ..

#inside 
$date = Get-Date -format "yyyy-MM-dd"
Compress-Archive -Path './app' -CompressionLevel 'Fastest' -DestinationPath "./backup-$date"
Write-Host "Created backup at $('./backup-' + $date + '.zip')"
##########################
# _FullyTax.ps1_
# Possible values: 'Minor', 'Adult', 'Senior Citizen'
$Status = 'Minor'
If ($Status -eq 'Minor') 
{
  Write-Host $False
} ElseIf ($Status -eq 'Adult') {
  Write-Host $True
} Else {
  Write-Host $False
}
########################################
##Catching Errors
Try {
   # Do something with a file.
} Catch [System.IO.IOException] {
   Write-Host "Something went wrong"
}  Catch {
   # Catch all. It's not an IOException but something else.
} Finally {
   # Clean up resources.
}



