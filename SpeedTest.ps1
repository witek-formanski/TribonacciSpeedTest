function MeasureTime {
    param(
        [string]$Command,
        [string]$Language
    )

    $milliseconds = (Measure-Command { Invoke-Expression $Command }).TotalMilliseconds
    Write-Output "${Language}:`n`t$milliseconds ms"
}

function GetVersion {
    param(
        [string]$Command,
        [string]$Language
    )
    
    $version = Invoke-Expression $Command
    Write-Output "`n${Language} version:`n$version"
}

Write-Output "System information:"
Write-Output "`tOS: $((Get-ComputerInfo).OsName)"
Write-Output "`tArchitecture: $((Get-ComputerInfo).OsArchitecture)"

GetVersion "node --version" "Node.js"
MeasureTime "node tribonacci.js" "Node.js"

GetVersion "g++ --version | Select-Object -First 1" "g++"
MeasureTime "g++ tribonacci.cpp" "C++ compile time"
MeasureTime ".\a.exe" "C++ runtime"

MeasureTime "g++ tribonacci.cpp -O1" "C++ compile time (O1)"
MeasureTime ".\a.exe" "C++ runtime (O1)"

MeasureTime "g++ tribonacci.cpp -O2" "C++ compile time (O2)"
MeasureTime ".\a.exe" "C++ runtime (O2)"

MeasureTime "g++ tribonacci.cpp -O3" "C++ compile time (O3)"
MeasureTime ".\a.exe" "C++ runtime (O3)"

GetVersion "dotnet --version" ".NET" 
$source = Get-Content -Raw -Path ".\Tribonacci.cs"
Add-Type -TypeDefinition "$source"
MeasureTime "[Pl.Edu.Mimuw.Program]::Tribonacci(37)" ".NET"

GetVersion "java --version" "Java"
MeasureTime "java Tribonacci.java" "Java"
MeasureTime "java -Xcomp -Xdiag Tribonacci.java" "Java (Xcomp)"
MeasureTime "java -Xint -Xdiag Tribonacci.java" "Java (Xint)"
