# mkcd: make a directory and cd into it
function mkcd --description 'mkdir -p and cd'
    mkdir -p $argv[1]; and cd $argv[1]
end
