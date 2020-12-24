function Write-Color([String[]]$Text, [ConsoleColor[]]$Color) {
    for ($i = 0; $i -lt $Text.Length; $i++) {
        Write-Host $Text[$i] -Foreground $Color[$i] -NoNewLine
    }
    Write-Host
}

if ((Test-Path $Profile) -eq $false)
{
    Write-Host "Creating Pofile" -ForegroundColor Yellow
    New-Item -Path $Profile -Type file –Force
}

$psDir = (Get-Item $Profile).Directory.FullName
$installDir = $psDir + "\Modules"

Write-Host "Copying Helper Module" -ForegroundColor Yellow
Copy-Item -Path .\PSHelpers -Destination $installDir

Write-Host "Adding Alias To Profile" -ForegroundColor Yellow
Add-Content -Path $Profile -Value "`nSet-Alias -Name env -Value Get-EnvironmentVariables"

Write-Color -Text "Open a new PowerShell window and type ", "env", " to see it work"  -Color Yellow,Green,Yellow