# EXOPps
Use the O365 MFA powershell console anywhere


You must first have the MFA console loaded and have connected at least once by using Connect-EXOPSSession

I Have the ps1 functions script dot sourced into my PS profile for CurrentUser/AllHosts

I also call the Start-ExchangeOnline function in the PS profile script

####################
# $Profile example #
####################


<# Start Script

# directory where my scripts are stored
. 'C:\Users\alex.watts\Documents\Functions\MyFunctions.ps1'
. 'C:\Users\alex.watts\Documents\Functions\EXOPps.ps1'

start-ExchangeOnline

#> End Script