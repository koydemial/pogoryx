#!/bin/bash
cd ~

rm -rf goproxy-heroku

git clone https://github.com/koydemial/pogoryx.git

cd goproxy-heroku

rm -rf .git

git init .

heroku create

chmod +x bootstrap proxy release.sh

./release.sh
