function Start-ExchangeOnline {
   <#
       .Description
        connects to Exchange online services for the logged on user

       .Example
        start-ExchangeOnline
        start-ExchangeOnline -upn 'first.last@domain.com'
        start-ExchangeOnline -Session 'protection'
        start-ExchangeOnline -Session s
   #>
	[CmdletBinding()]
	param (
		[string]
		$upn = (Get-ADUser -Identity $env:USERNAME -Properties emailaddress | Select-Object -ExpandProperty emailaddress),
		[validateset('s', 'Service', 'p', 'Protection', 'n', 'None')][string]
		$session
	)
	
	$session = read-host -Prompt 'Select your session; (S)ervice, (P)rotection, (N)one'
	
	switch -Wildcard ($session) {
		
		S* {
			Connect-EXOPSsession -userprincipalname $upn
		}
		
		P* {
			Connect-IPPSSession -userprincipalname $upn
		}
		N* {
			Continue
		}
	}
}

function Start-ExchangeOnlineNOAD {
   <#
       .Description
        connects to Exchange online services for the logged on user

       .Example
        start-ExchangeOnline
        start-ExchangeOnline -upn 'first.last@domain.com'
        start-ExchangeOnline -Session 'protection'
        start-ExchangeOnline -Session s
   #>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)][ValidateScript({
				If ($_ -match '(([\w\.\-]*)\@([\w\.\-]+))') {
					$True
				}
				Else {
					throw 'Please enter a valid UPN'
				}
			})]
		[string]
		$upn,
		[validateset('s', 'Service', 'p', 'Protection', 'n', 'None')][string]
		$session
	)
	
	$session = read-host -Prompt 'Select your session; (S)ervice, (P)rotection, (N)one'
	
	switch -Wildcard ($session) {
		
		S* {
			Connect-EXOPSsession -userprincipalname $upn
		}
		
		P* {
			Connect-IPPSSession -userprincipalname $upn
		}
		N* {
			Continue
		}
	}
}