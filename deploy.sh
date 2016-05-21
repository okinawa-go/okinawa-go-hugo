#!/bin/bash

src="./public/*"
dest="../okinawa-go.github.io/"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

\rm -rf $src

# Build the project. 
hugo -t hugo-creative-theme
# if using a theme, replace by `hugo -t <yourtheme>`

# copy files
cp -r $src $dest

cd $dest
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

#Push source and build repos.
git push origin master

# Come Back
cd ../okinawa-go-hugo
