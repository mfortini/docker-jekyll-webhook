#!/bin/bash

if [ ! -d /source/.git ]; then
  git clone $REPO /source
fi

cd /source
git checkout $BRANCH
git reset --hard
git pull origin $BRANCH
gem install bundle
bundle update

bundle exec jekyll build --destination /site

cd -

