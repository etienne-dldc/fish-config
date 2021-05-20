
# deno
set -x PATH $PATH $HOME/.local/bin

set -x DENO_INSTALL /Users/etienne/.deno
set -x PATH $PATH $DENO_INSTALL/bin

# rust
set -x PATH $PATH $HOME/.cargo/bin

# coreutils

set -x PATH $PATH /usr/local/opt/coreutils/libexec/gnubin

set -x ANDROID_HOME $HOME/Library/Android/sdk

# golang config
# set the workspace path
set -x GOPATH $HOME/go
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

set PATH $PATH $ANDROID_HOME/emulator
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools

# Postgres.app
set PATH $PATH /Applications/Postgres.app/Contents/Versions/latest/bin

# if type -q nvm
#     nvm use default
# end

function install-est
    git clone git@github.com:etienne-dldc/etienne-shell-tools.git ~/Workspace/github.com/etienne-dldc/etienne-shell-tools
    git clone git@github.com:etienne-dldc/netlify-shortener.git ~/Workspace/github.com/etienne-dldc/netlify-shortener
end

function git-sync
    git fetch $argv[1]
    git checkout $argv[2]
    git merge "$argv[1]/$argv[2]"
end

# Fix macos mic issue
function fix-mic
    sudo kextunload /System/Library/Extensions/AppleHDA.kext
    sudo kextload /System/Library/Extensions/AppleHDA.kext
end

function git-clean
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d
end

function git-clean-list
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | echo
end

function reload
    source ~/.config/fish/config.fish
end

# Custom tools
function est
    npx -p ~/Workspace/github.com/etienne-dldc/etienne-shell-tools est $argv
end

# URL shortener
function shorten
    npx -p ~/Workspace/github.com/etienne-dldc/netlify-shortener shorten $argv
end

function clone
    est clone $argv
end

function tsc
    npx -p typescript tsc $argv
end

# Node CLI tool
function oclif
    npx oclif $argv
end

function npm-check
    npx npm-check -u $argv
end

function overmind-devtools
    npx overmind-devtools
end

function yarn-deduplicate
    npx yarn-deduplicate $argv
end

function cra
    npx create-react-app $argv
end

function cra-ts
    npx create-react-app $argv --template typescript
end

function cap
    npx caprover $argv
end

function caprover
    npx caprover $argv
end

function serve
    npx serve $argv
end

function http-server
    npx http-server $argv
end

function rn
    npx react-native $argv
end

function rna
    npx react-native run-android
end

function typeorm
    npx typeorm $argv
end

function lerna
    npx lerna $argv
end

function npm-name
    npx -p npm-name-cli npm-name $argv
end

function zx-run
    npx zx ~/Workspace/github.com/etienne-dldc/zx-scripts/scripts/$argv[1].mjs $argv[2..-1]
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

