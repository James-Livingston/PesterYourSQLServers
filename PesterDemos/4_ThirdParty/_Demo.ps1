Import-Module C:\Dev\PesterYourSQLServers\PesterDemos\Modules\dbachecks-master\dbachecks.psm1

Get-DbcCheck | Format-Table

Invoke-DbcCheck -SqlInstance 'localhost\sql1' -Check MaxMemory

Invoke-DbcCheck -SqlInstance 'localhost\sql1' -Check Instance

Invoke-DbcCheck -SqlInstance 'localhost\sql1' -AllChecks