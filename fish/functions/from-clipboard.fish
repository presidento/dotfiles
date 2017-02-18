function from-clipboard -d "Print the content of the clipboard"
    xclip -out -selection clipboard $argv
end
