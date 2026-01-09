REQUIRED_FILES=(
    "$HOME/.dotfiles/zsh/local.zsh"
    "$HOME/.dotfiles/git/gitconfig.local"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "$file" ]]; then
    echo "Missing required file: $file"
    exit 1
    fi
done


#Prompt user for github username, set it globally.
#Run this script on a new machine or to change gh accounts
#Github user is currently defined in local.zsh, so just leave blank, or re-enter

set -e 

ENV_FILE = "$HOME/.config/dotfiles/env"

mkdir -p "$(dirname "$ENV_FILE")"

if [[ ! -f "$ENV_FILE" ]]; then
    echo "Setting up dotfiles environment..."
    read -rp "Github username: " GH_USERNAME

     cat <<EOF > "$ENV_FILE"
# Dotfiles local environment
export GH_USERNAME="$GH_USERNAME"
EOF
    chmod 600 "$ENV_FILE"
    echo "Saved Github username to $ENV_FILE"
else
    echo "Dotfiles already exist"
fi

git config --global user.name "$GH_USERNAME"
git config --global user.email "$GH_USERNAME@users.noreply.github.com"