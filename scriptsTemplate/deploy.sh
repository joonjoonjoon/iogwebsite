#!/bin/bash  
cd ..
git pull
git add .
got add -A
git commit -a -m "[auto commit by joon]"
git push
lftp -e "mirror -R htdocs htdocs && exit" -u USERNAME,PASSWORD FTPSERVER