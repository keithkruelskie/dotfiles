# dotfiles
dotfiles for personal workflows

# Setup of Dotfiles
## [1] Clone the bare repo
```bash
git clone --bare https://github.com/kkruelskie/dotfiles.git $HOME/.dotfiles
```

# [2] Helper alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# [3] Either symlink or create a minimal .zshrc in HOME that sources it

## [A] Symlink:
```bash
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
```

## [B] Simple .zshrc in $HOME:
```zsh
export DOTFILES="$HOME/.dotfiles"
source "$DOTFILES/zsh/zhsrc"
```

# [4] Optional: Run Install Scripts
```bash
$HOME/.dotfiles/bootstrap/install.sh
```
The install script will check for required local zsh and gitconfig values, as well as run
a script to add your github username as a global git variable $GH_USERNAME

# [5] Optional: Run local repo override Scripts
# TODO


This leaves the default state as the core zsh pieces implemented, with optional overrides for work stream type, and git configurations.