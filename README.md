# rtweet-R
This repo contains the code to fetch tweets from twitter using rtweet package in R and updating them everyday .

# app-wprkflow
The file fetctweet.R contains a script which is ran by github action at 00:00 UTC . This script fetches all tweets from twitter which has #rstats word in it. Everyday tweet data is stored in tweetdt folder.

# flaws in app
The storing of tweets at 00:00 UTC gets delayed that is it doesn't get scheduled on exact time. It is an GitHub action issue. Link to the discussion is given below and a reply from a GitHub employee.

discussion: https://github.community/t/scheduled-events-are-substantially-delayed/115513

reply from GitHub employee: https://github.community/t/scheduled-events-are-substantially-delayed/115513/4
