# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\youknow.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Linux
# Alias supplémentaires pour Windows -> Linux
Set-Alias cat 'C:\Program Files\Git\usr\bin\cat.exe'
Set-Alias rm 'C:\Program Files\Git\usr\bin\rm.exe'
Set-Alias mv 'C:\Program Files\Git\usr\bin\mv.exe'
Set-Alias touch 'C:\Program Files\Git\usr\bin\touch.exe'
Set-Alias df 'C:\Program Files\Git\usr\bin\df.exe'
Set-Alias du 'C:\Program Files\Git\usr\bin\du.exe'
Set-Alias ps 'C:\Program Files\Git\usr\bin\ps.exe'
Set-Alias kill 'C:\Program Files\Git\usr\bin\kill.exe'
Set-Alias awk 'C:\Program Files\Git\usr\bin\awk.exe'
Set-Alias sed 'C:\Program Files\Git\usr\bin\sed.exe'
Set-Alias chmod 'C:\Program Files\Git\usr\bin\chmod.exe'
Set-Alias chown 'C:\Program Files\Git\usr\bin\chown.exe'
Set-Alias uname 'C:\Program Files\Git\usr\bin\uname.exe'
Set-Alias clear 'C:\Program Files\Git\usr\bin\clear.exe'
Set-Alias basename 'C:\Program Files\Git\usr\bin\basename.exe'
Set-Alias dirname 'C:\Program Files\Git\usr\bin\dirname.exe'
Set-Alias head 'C:\Program Files\Git\usr\bin\head.exe'
Set-Alias tail 'C:\Program Files\Git\usr\bin\tail.exe'
Set-Alias wc 'C:\Program Files\Git\usr\bin\wc.exe'
Set-Alias cut 'C:\Program Files\Git\usr\bin\cut.exe'
Set-Alias uniq 'C:\Program Files\Git\usr\bin\uniq.exe'
Set-Alias xargs 'C:\Program Files\Git\usr\bin\xargs.exe'
Set-Alias tr 'C:\Program Files\Git\usr\bin\tr.exe'
Set-Alias find 'C:\Program Files\Git\usr\bin\find.exe'
Set-Alias grep 'C:\Program Files\Git\usr\bin\grep.exe'
Set-Alias date 'C:\Program Files\Git\usr\bin\date.exe'
Set-Alias expr 'C:\Program Files\Git\usr\bin\expr.exe'
Set-Alias ln 'C:\Program Files\Git\usr\bin\ln.exe'
Set-Alias env 'C:\Program Files\Git\usr\bin\env.exe'
Set-Alias whoami 'C:\Program Files\Git\usr\bin\whoami.exe'
Set-Alias yes 'C:\Program Files\Git\usr\bin\yes.exe'
Set-Alias tar 'C:\Program Files\Git\usr\bin\tar.exe'
Set-Alias gzip 'C:\Program Files\Git\usr\bin\gzip.exe'
Set-Alias unzip 'C:\Program Files\Git\usr\bin\unzip.exe'
Set-Alias ping 'C:\Windows\System32\ping.exe'
Set-Alias nslookup 'C:\Windows\System32\nslookup.exe'
Set-Alias ipconfig 'C:\Windows\System32\ipconfig.exe'
Set-Alias netstat 'C:\Windows\System32\netstat.exe'
Set-Alias arp 'C:\Windows\System32\arp.exe'
Set-Alias route 'C:\Windows\System32\route.exe'
Set-Alias shutdown 'C:\Windows\System32\shutdown.exe'
function reboot { & 'C:\Windows\System32\shutdown.exe' /r /t 0 }

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

fastfetch