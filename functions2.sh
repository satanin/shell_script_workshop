#!/bin/bash
git_branch () {
  git branch --show-current
}

echo "Our current git branch is $(git_branch)"