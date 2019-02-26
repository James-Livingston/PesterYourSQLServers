Describe 'SQL Server Services' {     

    Context 'SQL Server service' {

        It 'Should be running' {
            (Get-Service 'MSSQL$SQL2017').Status | Should -Be 'Running'
        }

        It 'Should be automatic start' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'MSSQL$SQL2017'}).StartMode | Should -Be 'Auto'
        }

        It 'Should be using .\SQLSVC' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'MSSQL$SQL2017'}).StartName | Should -Be '.\SQLSVC'
        }

    }
    Context 'SQL Server Agent service' {

        It 'Should be running' {
            (Get-Service 'SQLAgent$SQL2017').Status | Should -Be 'Running'
        }

        It 'Should be automatic start' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'SQLAgent$SQL2017'}).StartMode | Should -Be 'Auto'
        }

        It 'Should be using .\SQLSVC' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'SQLAgent$SQL2017'}).StartName | Should -Be '.\SQLSVC'
        }
    }
}