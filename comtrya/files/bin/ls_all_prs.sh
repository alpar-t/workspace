#!/bin/bash

set -e

GITHUB_TOKEN=$(<~/.elastic/github.token)

# Fetch all repositories for the authenticated user
repos="elastic/release-eng elastic/cloud elastic/unified-release elastic/infra"

# Iterate over each repository and list PRs created by the authenticated user
for repo in $repos; do
  echo "== Pull requests for repository: $repo =="
  prs=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/repos/$repo/pulls?state=open&per_page=1000" | jq -r --arg username "$(gh api user --jq '.login')" '.[] | select(.user.login == $username) | " - \(.html_url) \(.title)"')
  if [ -n "$prs" ]; then
    echo "$prs"
  fi
done
