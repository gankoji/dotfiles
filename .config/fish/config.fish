if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf_configure_bindings --directory=\cf
    zoxide init fish | source
    set -gx EDITOR nvim
    set -gx OPENAI_API_KEY $(gopass show ai/openai-key)
    # BEGIN opam configuration
    # This is useful if you're using opam as it adds:
    #   - the correct directories to the PATH
    #   - auto-completion for the opam binary
    # This section can be safely removed at any time if needed.
    test -r '/home/jacbaile/.opam/opam-init/init.fish' && source '/home/jacbaile/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
    # END opam configuration

    # NVM/NPM/Node.js config
    set -Ux nvm_default_version v23.11.0
end
