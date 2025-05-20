function zellij --description 'alias zellij zellij attach -c (string join "" $USER "@" $hostname)'
 command zellij attach -c (string join "" $USER "@" $hostname) $argv
        
end
