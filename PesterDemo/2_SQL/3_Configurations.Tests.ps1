#Capture database details on our instance
$SQLInstance = 'localhost\sql1'

$Query       = `
"SELECT [name], [value] 
FROM sys.configurations
WHERE [name] IN 
('min server memory (MB)', 
'max server memory (MB)', 
'cost threshold for parallelism', 
'max degree of parallelism', 
'remote query timeout (s)', 
'backup compression default')"

$ConfigQueryRes = Invoke-SQLCMD -ServerInstance $SQLInstance -Database 'master' -Query $Query

Describe "Instance Configuration on $SQLInstance"  {

    It "Remote Query Timeout should be 300" {
        $remotequerytimeout = ($ConfigQueryRes | Where {$_.name -eq 'remote query timeout (s)'}).value
        $remotequerytimeout | Should -Be 300
    }
    It "Backup Compression Default should be set " {
        $backupcompression = ($ConfigQueryRes | Where {$_.name -eq 'backup compression default'}).value
        $backupcompression | Should -Be 1
    }
    It "Minimum Server Memory should be set" {
        $minmem = ($ConfigQueryRes | Where {$_.name -eq 'min server memory (MB)'}).value
        $minmem | Should -Not -Be 0
    }
    It "Maximum Server Memory should be set" {
        $maxmem = ($ConfigQueryRes | Where {$_.name -eq 'max server memory (MB)'}).value
        $maxmem | Should -Not -Be 2147483647
    }
    It "Cost Threshold for Parallelism should be 50" {
        $CTP = ($ConfigQueryRes | Where {$_.name -eq 'cost threshold for parallelism'}).value
        $CTP | Should -Be 50
    }
        
    It "Max Degree of Parallelism should be set" {
        $MAXDOP = ($ConfigQueryRes | Where {$_.name -eq 'max degree of parallelism'}).value
        $MAXDOP | Should -Not -Be 0
    }
}