# ~/.zshrc — managed by Home Manager (symlinked via home.file)

# --- history ---------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=42000
SAVEHIST=42000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE

# --- options / keybindings -------------------------------------------------
setopt NOTIFY
unsetopt NOMATCH
unsetopt AUTO_CD
bindkey -e

# --- completion ------------------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# --- Nix / Home Manager on PATH -------------------------------------------
# Source HM session vars + profile so `home-manager switch` packages are on PATH
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# --- prompt: oh-my-posh (atomic theme) -------------------------------------
# Runs after the Nix profile is on PATH. Theme ships inside the oh-my-posh pkg.
eval "$(oh-my-posh init zsh \
  --config "$HOME/.nix-profile/share/oh-my-posh/themes/night-owl.omp.json")"

# --- prompt fallback -------------------------------------------------------
# Static prompt; only needed if oh-my-posh is not available.
# autoload -Uz colors && colors
# PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '

# --- aliases ---------------------------------------------------------------
alias ls='eza'
alias ll='eza -la --git'
alias cat='bat --paging=never'
alias vi='vim -u DEFAULTS "+set mouse="'

# One-command Home Manager rebuild (needs --impure; see the repo README).
alias hms='home-manager switch --flake "$HOME/.config/home-manager#$USER" --impure'

# --- fzf -------------------------------------------------------------------
source "$HOME/.nix-profile/share/fzf/key-bindings.zsh"
source "$HOME/.nix-profile/share/fzf/completion.zsh"

# --- zoxide ----------------------------------------------------------------
eval "$(zoxide init zsh)"

# --- zsh plugins (installed via Home Manager) ------------------------------
# fzf-tab (Loads AFTER compinit, BEFORE the widget-wrapping plugins below)
source "$HOME/.nix-profile/share/fzf-tab/fzf-tab.plugin.zsh"

# sudo
source "$HOME/.nix-profile/share/oh-my-zsh/plugins/sudo/sudo.plugin.zsh"

# autosuggestions
source "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# syntax-highlighting (MUST be sourced last - it wraps ZLE widgets)
source "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
