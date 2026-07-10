{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # ---------------------------------------------------------------------------
  # PACKAGES
  #
  # Home Manager installs programs, reproducibly and pinned via flake.lock.
  # Add a program to the list below and it shows up on $PATH after running
  # `home-manager switch`.
  # ---------------------------------------------------------------------------
  home.packages = with pkgs; [
    # zsh + plugins (+ prompt)
    zsh
    oh-my-zsh                 # source of oh-my-zsh plugins
    zsh-autosuggestions       # grey inline suggestions from history
    zsh-syntax-highlighting   # colourise the command line as you type
    zsh-fzf-tab               # fzf-powered tab completion
    oh-my-posh                # prompt engine; themes in share/oh-my-posh/themes/

    # tmux + plugins
    tmux
    tmuxPlugins.sensible      # a handful of universally-agreed defaults
    tmuxPlugins.resurrect     # save/restore sessions
    tmuxPlugins.continuum     # periodic auto-save

    # editor
    vim-full

    # everyday CLI tools
    fzf
    ripgrep
    fd
    bat
    eza
    jq
    zoxide
  ];

  # ---------------------------------------------------------------------------
  # DOTFILES
  #
  # Home Manager owns the dotfiles too. Each entry is an OUT-OF-STORE symlink:
  # ~/.zshrc points straight at the repo file, so edits are live immediately —
  # no `home-manager switch` needed for a quick test. Run `hms` only when you
  # add/remove a file here or change packages.
  #
  # The tradeoff: the target path is fixed. This repo must live at
  # ~/.config/home-manager. If you keep it elsewhere, update `repoDir` below.
  # ---------------------------------------------------------------------------
  home.file =
    let
      repoDir = "${config.home.homeDirectory}/.config/home-manager";
      link = name: {
        source = config.lib.file.mkOutOfStoreSymlink "${repoDir}/${name}";
      };
    in
    {
      ".zshrc" = link "zsh/.zshrc";
      ".gitignore" = link "git/.gitignore";
      ".tmux.conf" = link "tmux/.tmux.conf";
      ".vimrc" = link "vim/.vimrc";
    };

  # Session variables sourced by Home Manager's shell hooks.
  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
