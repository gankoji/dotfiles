# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/jacbaile/.opam/opam-init/init.fish' && source '/home/jacbaile/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration

if status is-interactive
    fzf_configure_bindings --directory=\cf
    zoxide init fish | source
    atuin init fish --disable-ctrl-r | source

    # NVM/NPM/Node.js config
    set -Ux nvm_default_version v23.11.0
    # set -gx ZELLIJ_AUTO_ATTACH false
    set -gx EDITOR nvim
    set -gx OPENAI_API_KEY $(gopass show ai/openai-key)

    # if not set -q ZELLIJ
    #     if test "$ZELLIJ_AUTO_ATTACH" = true
    #         zellij attach -c (string join "" $USER "@" $hostname)
    #     else
    #         zellij
    #     end

    #     if test "$ZELLIJ_AUTO_EXIT" = true
    #         kill $fish_pid
    #     end
    # end
end
