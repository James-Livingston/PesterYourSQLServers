#Capture database details on our instance
$SQLInstance = 'localhost\SQL2017'

$Query       = `
"SELECT [name]
, SUSER_SNAME(owner_sid) AS Owner
, CONVERT(varchar(10),DATABASEPROPERTYEX([Name] , 'IsAutoClose')) AS AutoClose
, CONVERT(varchar(10),DATABASEPROPERTYEX([Name] , 'IsAutoShrink')) AS AutoShrink
FROM master.sys.databases
WHERE [name] = '$global:DatabaseToTest'"

$DatabaseResults = Invoke-SQLCMD -ServerInstance $SQLInstance -Database 'master' -Query $Query

#Testing
Describe "Database Settings on $SQLInstance" {

    Context "$($DatabaseResults.Name)" {

        It 'Should be owned by sa' {
            $DatabaseResults.Owner | Should -Be 'sa'
        }

        It 'Should have auto close disabled' {
            $DatabaseResults.AutoClose | Should -Be 0
        }

        It 'Should have auto shrink disabled' {
            $DatabaseResults.AutoShrink | Should -Be 0
        }
    }#Context
}#Describe