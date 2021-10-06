#!/bin/bash
create_branch () {
  branch_name=$1
  echo "Creating new branch $branch_name"
  git branch $branch_name
}
create_branch "my_branch"