git pull
git add .
git commit -a -m "[auto commit by INSERT NAME HERE]"
git push
lftp -e "mirror -R ../htdocs htdocs && exit" -u USERNAME,PASSWORD FTPSERVER