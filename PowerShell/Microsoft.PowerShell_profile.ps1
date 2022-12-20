oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jblab_2021.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
        (zoxide init --hook $hook powershell | Out-String)
    })

Enable-PowerType
Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Chord Ctrl+j -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function HistorySearchBackward
