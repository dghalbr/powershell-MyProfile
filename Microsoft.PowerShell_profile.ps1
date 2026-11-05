Import-Module MyProfile
Import-Module Terminal-Icons -ErrorAction SilentlyContinue
Import-Module posh-git -ErrorAction SilentlyContinue
Import-Module PSFzf -ErrorAction SilentlyContinue

oh-my-posh init pwsh --config "bubblesextra" | Invoke-Expression

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Key UpArrow HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow HistorySearchForward

Set-PsFzfOption `
    -PSReadlineChordProvider 'Ctrl+t' `
    -PSReadlineChordReverseHistory 'Ctrl+r'
    
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias cat bat
Set-Alias grep rg
Set-Alias vim nvim
