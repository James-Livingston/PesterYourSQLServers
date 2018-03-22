# OutputFile
Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -OutputFile 'C:\Dev\PesterDemos\1_Pester\TestResults.xml'

# Show
Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester'

Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -Show Passed

Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -Show Failed

Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -Show Summary

Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -Show None

# PassThru
Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -PassThru -Show None

# Capture the PassThru results into a PowerShell object
$Results = Invoke-Pester -Script 'C:\Dev\PesterDemos\1_Pester' -PassThru -Show None

$Results.TotalCount
$Results.PassedCount
$Results.FailedCount

$Results.TestResult
$Results.TestResult | Select Describe, Context, Name, Result

# HTML
$Results.TestResult | Select Describe, Context, Name, Result | ConvertTo-Html | Set-Content 'TestResults.html'

# Failed Tests
$Results.TestResult | Where-Object {$_.Result -eq 'Failed'} 

# SQL
$FailedTests = $Results.TestResult | Where-Object {$_.Result -eq 'Failed'} 

foreach ($Test in $FailedTests) {
    Invoke-Sqlcmd -ServerInstance 'localhost\sql1' -Database 'Demo0' -Query `
    "INSERT INTO [dbo].[PesterResults] VALUES
        ('$($Test.Describe)'
        ,'$($Test.Context)'
        ,'$($Test.Name)'
        ,'$($Test.Result)'
        ,GETDATE())"
}


# Test Parameters with Script Hash Table
Invoke-Pester -Script @{Path = 'C:\Dev\PesterDemos\3_Parameters\DatabaseHash.Tests.ps1'; Parameters = @{Database = 'Demo0'}}
Invoke-Pester -Script @{Path = 'C:\Dev\PesterDemos\3_Parameters\DatabaseHash.Tests.ps1'; Parameters = @{Database = 'Demo2'}}
Invoke-Pester -Script @{Path = 'C:\Dev\PesterDemos\3_Parameters\DatabaseHash.Tests.ps1'; Parameters = @{Database = 'Demo4'}}
Invoke-Pester -Script @{Path = 'C:\Dev\PesterDemos\3_Parameters\DatabaseHash.Tests.ps1'; Parameters = @{Database = 'Demo6'}}

# Test Parameters with Global Variables
$global:DatabaseToTest = 'Demo1'
Invoke-Pester -Script 'C:\Dev\PesterDemos\3_Parameters\DatabaseGlobal.Tests.ps1'
$global:DatabaseToTest = 'Demo3'
Invoke-Pester -Script 'C:\Dev\PesterDemos\3_Parameters\DatabaseGlobal.Tests.ps1'
