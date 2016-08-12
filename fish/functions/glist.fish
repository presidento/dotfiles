function glist
    for ref in (git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes)
        git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n"
    end | awk '! a[$0]++'
end
