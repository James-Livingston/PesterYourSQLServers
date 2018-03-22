Describe 'SQL Server Services' {     

    Context 'SQL Server service' {

        It 'Should be running' {
            (Get-Service 'MSSQL$SQL1').Status | Should Be 'Running'
        }

        It 'Should be automatic start' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'MSSQL$SQL1'}).StartMode | Should Be 'Automatic'
        }

        It 'Should be using .\SQLSVC' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'MSSQL$SQL1'}).StartName | Should Be '.\SQLSVC'
        }

    }
    Context 'SQL Server Agent service' {

        It 'Should be running' {
            (Get-Service 'SQLAgent$SQL1').Status | Should Be 'Running'
        }

        It 'Should be automatic start' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'SQLAgent$SQL1'}).StartMode | Should Be 'Automatic'
        }

        It 'Should be using .\SQLSVC' {
            (Get-WmiObject Win32_Service | Where-Object {$_.Name -eq 'SQLAgent$SQL1'}).StartName | Should Be '.\SQLSVC'
        }
    }
}