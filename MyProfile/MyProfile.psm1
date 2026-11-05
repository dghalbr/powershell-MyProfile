function ls { eza --icons @args }
function ll { eza -alh --group-directories-first --icons @args }
function la { eza -a --icons @args }
function lt { 
    param(
        [int]$level = 2
    ) 
    eza --tree --level=$level --icons @args
}
function lta { 
    param(
        [int]$level = 3
    ) 
    eza --tree --level=$level -a --icons @args
}

function lg  { eza -alh --git --icons @args }
function lgi { eza -alh --git --git-ignore --icons @args }

function lr  { eza -alh --sort=modified --reverse --icons @args }
function lx  { eza -alh --sort=extension --icons @args }
function lsz { eza -alh --sort=size --icons @args }

function l1 { eza -1 --icons @args }

function ff { fd . | fzf }
function fcd {
    $target = fd --type d --absolute-path | fzf

    if ($target) {
        Set-Location $target
    }
}
function fcf { fd --type f --absolute-path | fzf }
function fch {
    $cmd = Get-Content (Get-PSReadLineOption).HistorySavePath |
        Sort-Object -Unique |
        fzf

    if ($cmd) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert($cmd)
    }
}

function g { git }

function Update-Profile {
    Import-Module MyProfile -Force
    . $PROFILE
}