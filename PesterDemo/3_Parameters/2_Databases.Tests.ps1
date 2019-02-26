#Capture database details on our instance
$SQLInstance = 'localhost\SQL2017'

$Query       = `
"SELECT [name]
, SUSER_SNAME(owner_sid) AS Owner
, CONVERT(varchar(10),DATABASEPROPERTYEX([Name] , 'IsAutoClose')) AS AutoClose
, CONVERT(varchar(10),DATABASEPROPERTYEX([Name] , 'IsAutoShrink')) AS AutoShrink
FROM master.sys.databases"

$Databases = Invoke-SQLCMD -ServerInstance $SQLInstance -Database 'master' -Query $Query

#Testing
Describe "Database Settings on $SQLInstance" {

    foreach ($Database in $Databases) {
        Context "$($Database.Name)" {

            It 'Should be owned by sa' {
                $Database.Owner | Should -Be 'sa'
            }

            It 'Should have auto close disabled' {
                $Database.AutoClose | Should -Be 0
            }

            It 'Should have auto shrink disabled' {
                $Database.AutoShrink | Should -Be 0
            }
        }#Context
    }#foreach
}#Describe