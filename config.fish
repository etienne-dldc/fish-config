# install fisher and run it if not installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    # Create symlink to `fishfile` 
    ln -s ~/Workspace/github.com/etienne-dldc/fish-config/fishfile ~/.config/fish/fishfile
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# deno
set -x PATH $PATH $HOME/.local/bin

set -x DENO_INSTALL /Users/etienne/.deno
set -x PATH $PATH $DENO_INSTALL/bin

# rust
set -x PATH $PATH $HOME/.cargo/bin

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
    npx -p ~/Workspace/github.com/etienne-dldc/etienne-shell-tools est $argv
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
    npx caprover $argv
end

function caprover
    npx caprover $argv
end

function serve
    npx serve $argv
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
    npx lerna $argv
end

function npm-name
    npx -p npm-name-cli npm-name $argv
end
