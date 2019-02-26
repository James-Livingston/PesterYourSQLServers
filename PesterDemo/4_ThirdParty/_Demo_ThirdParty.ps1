# SQL Services tests with DBATOOLS
Invoke-Pester -Script 'C:\PesterDemo\4_ThirdParty\SQLServices.Tests.ps1'

# Databases tests with DBATOOLS
Invoke-Pester -Script 'C:\PesterDemo\4_ThirdParty\Databases.Tests.ps1'

# DBA Checks
Import-Module C:\Dev\PesterDemos\Modules\dbachecks-master\dbachecks.psm1

# Lookup the available checks
Get-DbcCheck | Format-Table

# Run MaxMemory Check
Invoke-DbcCheck -SqlInstance 'localhost\SQL2017' -Check MaxMemory

# Run Instance Check
Invoke-DbcCheck -SqlInstance 'localhost\SQL2017' -Check Instance

# Run All Checks
Invoke-DbcCheck -SqlInstance 'localhost\SQL2017' -AllChecks