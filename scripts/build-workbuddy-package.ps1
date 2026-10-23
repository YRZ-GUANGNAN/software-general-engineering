param(
    [Parameter(Mandatory = $true)]
    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$outputFullPath = [System.IO.Path]::GetFullPath($OutputPath)
$outputParent = Split-Path -Parent $outputFullPath
$stageRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('software-general-engineering-' + [guid]::NewGuid().ToString('N'))

try {
    New-Item -ItemType Directory -Force -Path $outputParent | Out-Null
    New-Item -ItemType Directory -Force -Path (Join-Path $stageRoot 'references') | Out-Null
    Copy-Item -LiteralPath (Join-Path $repoRoot 'workbuddy\SKILL.md') -Destination (Join-Path $stageRoot 'SKILL.md')
    Copy-Item -LiteralPath (Join-Path $repoRoot 'references\acceptance-checklist.md') -Destination (Join-Path $stageRoot 'references\acceptance-checklist.md')
    Copy-Item -LiteralPath (Join-Path $repoRoot 'references\engineering-workflow.md') -Destination (Join-Path $stageRoot 'references\engineering-workflow.md')
    Copy-Item -LiteralPath (Join-Path $repoRoot 'references\report-template.md') -Destination (Join-Path $stageRoot 'references\report-template.md')
    Copy-Item -LiteralPath (Join-Path $repoRoot 'references\usage-examples.md') -Destination (Join-Path $stageRoot 'references\usage-examples.md')

    if (Test-Path -LiteralPath $outputFullPath) {
        Remove-Item -LiteralPath $outputFullPath -Force
    }
    Compress-Archive -Path (Join-Path $stageRoot '*') -DestinationPath $outputFullPath -CompressionLevel Optimal
    Write-Output $outputFullPath
}
finally {
    if (Test-Path -LiteralPath $stageRoot) {
        Remove-Item -LiteralPath $stageRoot -Recurse -Force
    }
}
