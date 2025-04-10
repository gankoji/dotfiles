if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf_configure_bindings --directory=\cf
    zoxide init fish | source
    atuin init fish --disable-ctrl-r | source
    set -gx EDITOR nvim
end
