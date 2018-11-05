# fish-config

My fish-shell &amp; fisher config

## Setup

```bash
# 1. Install `fish`
brew install fish
# 2. Set fish as default shell
chsh -s /usr/local/bin/fish
# 3. Reload terminal
# 4. Install `fisher`
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# 5. Clone this repo
git clone git@github.com:etienne-dldc/fish-config.git ~/Workspace/github.com/etienne-dldc/fish-config
# 6. Create symlink to `config.fish`
ln -s ~/Workspace/github.com/etienne-dldc/fish-config/config.fish ~/.config/fish/config.fish
# 7. Create symlink to `fishfile`
ln -s ~/Workspace/github.com/etienne-dldc/fish-config/fishfile ~/.config/fish/fishfile
# 8. Run `fisher`
fisher
# 9. Reload terminal
# 10. Install `etienne-shell-tool`
install-est
```
