. C:\PesterDemo\1_Pester\Calculator.ps1

Describe 'Calculator' {
    Context 'When calling Add' {
        It '2 plus 3 should equal 5' {
            add -X 2 -Y 3 | Should -Be 5
        }

        It "-2 plus 10 should equal 8" {
            add -X -2 -Y 10 | Should -Be 8
        }
    }    
    Context 'When calling Subtract' {
        It '7 minus 3 should equal 4' {
            subtract -X 7 -Y 3 | Should -Be 4
        }

        It "-5 minus 5 should equal -10" {
            subtract -X -5 -Y 5 | Should -Be -10
        }
    }
}