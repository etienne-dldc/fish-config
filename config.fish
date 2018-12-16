# deno
set PATH $PATH "/Users/etienne/.deno/bin"

set -x ANDROID_HOME $HOME/Library/Android/sdk

set PATH $PATH $ANDROID_HOME/emulator
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools

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
    npx overmind-devtools@next
end

function yarn-fix
    npx yarn-tools fix-duplicates ./yarn.lock $argv >fixed-yarn.lock

    get --prompt="Replace yarn.lock [yY]?:" --rule="[yY]" | read confirm
    switch $confirm
        case Y y
            rm ./yarn.lock
            mv ./fixed-yarn.lock ./yarn.lock
    end
end

function cdd
    npx captainduckduck $argv
end

function cra
    npx create-react-app $argv
end

# function cra-ts
#     npx create-react-app $argv --scripts-version=react-scripts-ts
# end

function cra-ts
    npx create-react-app $argv --typescript
    cd "./$argv[1]"
    yarn add typescript @types/node @types/react @types/react-dom @types/jest
end

function cdd-tar
    npx captainduckduck deploy -t ./deploy.tar $argv
end

function jss
    npx jss $argv
end

function serve
    npx serve $argv
end

function captainduckduck
    npx captainduckduck $argv
end

function rn
    npx -p react-native-cli react-native $argv
end

function rna
    npx -p react-native-cli react-native run-android
end
