#!/usr/bin/env bash

MAIL="YOUR MAIL ADDRESS"
PASSWORD="YOUR PASSWORD"
PSWD="`echo -n "$PASSWORD" | sha512sum | cut -f1 -d' '`"

blih -u $MAIL -t $PSWD repository create $1
blih -u $MAIL -t $PSWD repository setacl $1 ramassage-tek rx
blih -u $MAIL -t $PSWD repository getacl $1
git clone git@git.epitech.eu:/$MAIL/$1
cd $1
touch ".gitignore"
echo ".gitignore created"
git commit --allow-empty -m "Initial commit"
git push -u origin master
echo "Repository successfully created =)"
