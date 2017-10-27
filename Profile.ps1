Import-Module posh-git

$Global:GitPromptSettings.BeforeText = '['
$Global:GitPromptSettings.AfterText = '] '

function prompt
{
    $origLastExitCode = $LASTEXITCODE

    Write-VcsStatus
    Write-Prompt $ExecutionContext.SessionState.Path.CurrentLocation -ForegroundColor Green
    Write-Prompt "`nI" -ForegroundColor DarkGray
    Write-Prompt " $([char]9829) " -ForegroundColor DarkRed
    Write-Prompt 'PS>' -ForegroundColor DarkGray

    $global:LASTEXITCODE = $origLastExitCode
    "$('' * ($nestedPromptLevel + 1)) "
}


# Playing with Ansi

# "$(Write-VcsStatus)$([char]0x1b)[1;32;3m$($ExecutionContext.SessionState.Path.CurrentLocation)`n$([char]0x1b)[90mI $([char]0x1b)[0;31m$([char]9829) $([char]0x1b)[90mPS>$('' * ($nestedPromptLevel + 1)) "


# function prompt {"I $([char]0x1b)[0;31m$([char]9829) $([char]0x1b)[0;37mPS> "}