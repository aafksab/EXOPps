![screenshot](https://raw.githubusercontent.com/aafksab/EXOPps/master/Shell.png)

# EXOPps
Use the O365 MFA powershell console anywhere


You must first have the MFA console loaded and have connected at least once by using Connect-EXOPSSession

I Have the ps1 functions script dot sourced into my PS profile for CurrentUser/AllHosts

I also call the Start-ExchangeOnline function in the PS profile script

# $Profile example
. 'C:\Users\aafksab\Documents\Functions\MyFunctions.ps1'
. 'C:\Users\aafksab\Documents\Functions\EXOPps.ps1'

if (!(Get-Module ActiveDirectory)) {
  Import-Module ActiveDirectory -DisableNameChecking
}

Start-ExchangeOnline
