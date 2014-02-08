#!/bin/bash

for repo in `cat git_repos.dat`; do
  git clone $repo
done