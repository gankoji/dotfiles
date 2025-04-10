function config --wraps='/usr/bin/git --git-dir=/home/jacbaile/.cfg/ --work-tree=/home/jacbaile' --description 'Wrapper for my dotfiles git repo.'
  /usr/bin/git --git-dir=/home/jacbaile/.cfg/ --work-tree=/home/jacbaile $argv
        
end
