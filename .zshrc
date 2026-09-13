# Command defaults
export FZF_DEFAULT_COMMAND="fd --type f"
export XDG_CONFIG_HOME="$HOME/.config"

# User executables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    z
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Desktop input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export INPUT_METHOD=fcitx

# Intel hardware video acceleration
export LIBVA_DRIVER_NAME=iHD

# Generate a new Pywal theme manually with:
# theme
alias theme='wal -i "$HOME/Downloads/wallpaper.png"'

# Apply Pywal colors to the terminal
if [[ -f "$HOME/.cache/wal/sequences" ]]; then
    cat "$HOME/.cache/wal/sequences"
fi

# Show machine summary with logo
fastfetch


# Added by Antigravity CLI installer
export PATH="/home/tanmay/.local/bin:$PATH"
