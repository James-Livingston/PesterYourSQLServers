#Capture database details on our instance
$Databases = Get-DbaDatabase -SqlInstance 'localhost\sql1'

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