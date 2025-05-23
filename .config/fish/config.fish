# opam configuration
test -r '/home/jacbaile/.opam/opam-init/init.fish' && source '/home/jacbaile/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true

if status is-interactive
    fzf_configure_bindings --directory=\cf --git_log=\cl --history=up --git_status=ß

    zoxide init fish | source

    # NVM/NPM/Node.js config
    set -Ux nvm_default_version v23.11.0
    set -gx EDITOR nvim
    set -gx OPENAI_API_KEY $(gopass show ai/openai-key)
    set -gx ANTHROPIC_API_KEY $(gopass show ai/anthropic-key)
    set -gx GEMINI_API_KEY $(gopass show ai/gemini-key)
    set -gx TAVILY_API_KEY $(gopass show ai/tavily-key)
    fish_vi_key_bindings
end
