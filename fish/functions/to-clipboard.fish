function to-clipboard -d "Copy content to clipboard from stdin or file"
    xclip -in -selection clipboard $argv
end
