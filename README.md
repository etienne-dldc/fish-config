# fish-config

My fish-shell &amp; fisher config

## VSCode ctrl+space fix

In Mac setting remove keybinding for ctrl+space (switching lang)

## Setup

```bash
# Restore ssh keys
# Install `fish`
brew install fish
# add fish as a shell (add /usr/local/bin/fish at the top)
vim /etc/shells
# Set fish as default shell
chsh -s /usr/local/bin/fish
# Reload terminal
# Clone this repo
git clone git@github.com:etienne-dldc/fish-config.git ~/Workspace/github.com/etienne-dldc/fish-config
# Create symlink to `config.fish`
ln -s ~/Workspace/github.com/etienne-dldc/fish-config/config.fish ~/.config/fish/config.fish
# Reload terminal
# Install `etienne-shell-tool`
install-est
```

## NginX

```bash
# install ngninx with brew
# then symlink config
ln -s ~/Workspace/github.com/etienne-dldc/fish-config/nginx.conf /usr/local/etc/nginx/nginx.conf
ln -s ~/Workspace/github.com/etienne-dldc/fish-config/nginx /usr/local/etc/nginx/dldc
# install minica (https://github.com/jsha/minica)
# create ./minica folder then run
minica --domains app.alerion.localhost
minica --domains api.alerion.localhost
minica --domains admin.alerion.localhost
minica --domains game.babel-cards.localhost
minica --domains backend.babel-cards.localhost
# start nginx
sudo nginx
```
