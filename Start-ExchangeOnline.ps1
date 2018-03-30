function global:Start-ExchangeOnline {
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
		[validateset('S', 'Service', 'P', 'Protection', 'C', 'Continue')][string]
		$session
	)
	
	$session = read-host -Prompt 'Select your session; (S)ervice, (P)rotection, (N)one'
	write-host "[-] Connecting to your Session..." -ForegroundColor green
	
	switch -Wildcard ($session) {
		
		S* {
			$ErrorOccured = $false
			try {
				$ErrorActionPreference = 'Stop'
				Connect-EXOPSsession -userprincipalname $upn
			}
			catch {
				write-host '[!] Session has become stale...' -ForegroundColor Yellow
				$ErrorOccured = $true
			}
			if ($ErrorOccured) {
				Write-Host "[+] Generating Fresh Session now..." -ForegroundColor Green
				Connect-EXOPSsession -userprincipalname $upn
			}
		}
		
		P* {
			$ErrorOccured = $false
			try {
				$ErrorActionPreference = 'Stop'
				Connect-IPPSSession -userprincipalname $upn
			}
			catch {
				write-host '[!] Session has become stale...' -ForegroundColor Yellow
				$ErrorOccured = $true
			}
			if ($ErrorOccured) {
				Write-Host "[+] Generating Fresh Session now..." -ForegroundColor Green
				Connect-IPPSSession -userprincipalname $upn
			}
		}
		C* {
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
  write-host "[-] Connecting to your Session..." -ForegroundColor green
	
  switch -Wildcard ($session) {
		
    S* {
      $ErrorOccured = $false
      try {
        $ErrorActionPreference = 'Stop'
        Connect-EXOPSsession -userprincipalname $upn
      }
      catch {
        write-host '[!] Session has become stale...' -ForegroundColor Yellow
        $ErrorOccured = $true
      }
      if ($ErrorOccured) {
        Write-Host "[+] Generating Fresh Session now..." -ForegroundColor Green
        Connect-EXOPSsession -userprincipalname $upn
      }
    }
		
    P* {
      $ErrorOccured = $false
      try {
        $ErrorActionPreference = 'Stop'
        Connect-IPPSSession -userprincipalname $upn
      }
      catch {
        write-host '[!] Session has become stale...' -ForegroundColor Yellow
        $ErrorOccured = $true
      }
      if ($ErrorOccured) {
        Write-Host "[+] Generating Fresh Session now..." -ForegroundColor Green
        Connect-IPPSSession -userprincipalname $upn
      }
    }
    C* {
      Continue
    }
  }
	
}