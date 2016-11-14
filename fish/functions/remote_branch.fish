function remote_branch
     git rev-parse --abbrev-ref --symbolic-full-name '@{u}'
end
