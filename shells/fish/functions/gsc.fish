function gsc --description 'Git sparse clone' --argument-names gitlink --argument-names gitpath
    set -l repo (echo $gitlink | /bin/grep -Po '(?<=.com/).+?/.+?$') 
    if test -z "$repo"
        echo "Could not parse git link '$gitlink'" >&2
        return
    else if test (curl -X GET https://api.github.com/repos/$repo | jq -r '.status') = "404"
        echo "Could not find repository '$gitlink'" >&2
        return
    end
    set -l tmpPath (basename $gitlink)
    mkdir -p $tmpPath
    cd $tmpPath
    git init
    git remote add -f origin "$gitlink"
    git config core.sparseCheckout true

    echo "$gitpath" >> .git/info/sparse-checkout

    git pull origin (git branch -r | /bin/grep -Po 'HEAD -> \K.*$' | xargs basename)
    prevd
end
