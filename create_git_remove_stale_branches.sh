#!/bin/bash

# Prune remote-tracking branches, then list and delete local branches with 'gone' upstreams
# Usage: script_name.sh [-f|--force]

delete_branches() {
    for branch in $1; do
        git branch -D "$branch"
        if [ $? -eq 0 ]; then
            echo "Forcefully deleted branch '$branch'"
        else
            echo "Failed to delete branch '$branch'"
        fi
    done
}

FORCE_DELETE=0

# Check for '--force' or '-f' flag
if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
    FORCE_DELETE=1
fi

# Ensure we're in a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: not a Git repository"
    exit 1
fi

# Prune remote-tracking branches
echo "Pruning remote-tracking branches..."
git remote prune origin

# List branches with gone upstreams
gone_branches=$(git for-each-ref --format '%(refname:short) %(upstream:track)' refs/heads | grep '\[gone\]' | cut -d' ' -f1)

if [ -z "$gone_branches" ]; then
    echo "No branches with 'gone' upstream found after pruning."
    exit 0
fi

echo "The following branches have 'gone' upstreams:"
echo "$gone_branches"

if [ $FORCE_DELETE -eq 1 ]; then
    echo "Forcefully deleting branches..."
    delete_branches "$gone_branches"
else
    read -p "Do you want to forcefully delete these branches? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        delete_branches "$gone_branches"
    else
        echo "Branch deletion aborted."
    fi
fi