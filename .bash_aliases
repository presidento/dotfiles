#!/usr/bin/env bash

# List git branches ordered by the age
alias glist='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk '"'! a["'$0'"]++'"

# Work with Blindspotter
alias bsp='cd ~/work/bsp; PATH=~/work/bsp-install/bin:$PATH PYTHONPATH=~/work/bsp:$PYTHONPATH'

# Copy to clipboard (works with STDIN and file parameter)
alias cop='xclip  -selection clipboard -in'
# Paste from clipboard to stdout
alias past='xclip -selection clipboard -out'
