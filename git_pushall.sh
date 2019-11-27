#!/bin/bash

git add .
sleep 2s
git commit -m "Made Change"
sleep 2s
git push -u origin master
sleep 2s
echo "Pushed to GitHub"
