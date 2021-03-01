
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

if type -q nvm
    nvm use default
end

function install-est
    git clone git@github.com:etienne-dldc/etienne-shell-tools.git ~/Workspace/github.com/etienne-dldc/etienne-shell-tools
    git clone git@github.com:etienne-dldc/netlify-shortener.git ~/Workspace/github.com/etienne-dldc/netlify-shortener
end

function git-sync
    git fetch $argv[1]
    git checkout $argv[2]
    git merge "$argv[1]/$argv[2]"
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
    pnpx -p ~/Workspace/github.com/etienne-dldc/etienne-shell-tools est $argv
end

# URL shortener
function shorten
    pnpx -p ~/Workspace/github.com/etienne-dldc/netlify-shortener shorten $argv
end

function clone
    est clone $argv
end

function tsc
    pnpx -p typescript tsc $argv
end

# Node CLI tool
function oclif
    pnpx oclif $argv
end

function npm-check
    pnpx npm-check -u $argv
end

function overmind-devtools
    pnpx overmind-devtools
end

function yarn-deduplicate
    pnpx yarn-deduplicate $argv
end

function cra
    pnpx create-react-app $argv
end

function cra-ts
    pnpx create-react-app $argv --template typescript
end

function cdd
    # npx captainduckduck $argv
    echo "Use cap (caprover)"
end

function cdd-tar
    # npx captainduckduck deploy -t ./deploy.tar $argv
    echo "Use cap (caprover)"
end

function captainduckduck
    # npx captainduckduck $argv
    echo "Use cap (caprover)"
end

function cap
    pnpx caprover $argv
end

function caprover
    pnpx caprover $argv
end

function serve
    pnpx serve $argv
end

function http-server
    pnpx http-server $argv
end

function rn
    pnpx react-native $argv
end

function rna
    pnpx react-native run-android
end

function typeorm
    pnpx typeorm $argv
end

function code-alerion
    code ~/Workspace/github.com/etienne-dldc/alerion-authent
    code ~/Workspace/github.com/etienne-dldc/alerion-data
    code ~/Workspace/github.com/etienne-dldc/alerion-data-client
end

function code-apollo
    code ~/Workspace/github.com/LeReacteur/lereacteur-api
    code ~/Workspace/github.com/LeReacteur/apollo
end

function lerna
    pnpx lerna $argv
end

function npm-name
    pnpx -p npm-name-cli npm-name $argv
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

