function ec --wraps=emacsclient --wraps='emacsclient -c' --description 'alias ec emacsclient'
    emacsclient -a "" -c -t $argv
end
