Describe 'SQL Server Services' {     
    
    $EngineService = Get-DbaSqlService -InstanceName 'SQL2017' -Type Engine
    $AgentService  = Get-DbaSqlService -InstanceName 'SQL2017' -Type Agent
    
    Context 'SQL Server service' {

        It 'Should be running' {
            $EngineService.State | Should Be 'Running'
        }

        It 'Should be automatic start' {
            $EngineService.StartMode | Should Be 'Automatic'
        }

        It 'Should be using .\SQLSVC' {
            $EngineService.StartName | Should Be '.\SQLSVC'
        }

    }
    Context 'SQL Server Agent service' {

        It 'Should be running' {
            $AgentService.State | Should Be 'Running'
        }

        It 'Should be automatic start' {
            $AgentService.StartMode | Should Be 'Automatic'
        }

        It 'Should be using .\SQLSVC' {
            $AgentService.StartName | Should Be '.\SQLSVC'
        }
    }
}