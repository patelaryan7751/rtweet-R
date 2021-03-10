library(rtweet)

passtoken <- create_token(
  app = "rtweetaryan",
  consumer_key = "AQTBQGS01OPlJOr1poBM5LHYW",
  consumer_secret = "BAecP5fg8nnKmxxz4v5PJCXIT7ng4Y1OFzqOphV5BpSf07zLoT",
  access_token = "1271766871964962817-FqjNzVvUDd7Rwylx9PmWeqUEpVOnhy",
  access_secret = "LcdmVuG0rj7z9XaNtH5IoLqt9XKgi6dsbgtuStgXHUVs7"
)

tweet_df <- search_tweets("#rstats", n=18000, since=Sys.Date()-1, until=Sys.Date(), token = passtoken )
sincer_id <- max(tweet_df$status_id)
tweetcnt_df <-nrow(tweet_df)
tweet_df2 <- search_tweets("#rstats", n=18000, since=Sys.Date()-1, until=Sys.Date(), since_id=sincer_id, token = passtoken )
sincer_id_df2 <- max(tweet_df2$status_id)
tweetcnt_df2 <-nrow(tweet_df2)

if(tweetcnt_df2!=0L){
  
tweet_dfn <- function(sincer_id_n,tweetcnt_df_n) {
  tweet_dfno <- search_tweets("#rstats", n=18000, since=Sys.Date()-1, until=Sys.Date(), since_id=sincer_id_n)
  sincer_id_dfn <- max(tweet_dfno$status_id)
  tweetcnt_dfno <-nrow(tweet_dfno)
  if(tweetcnt_df_n!=0L){
    tweetfi <- rbind(tweetfi, tweet_dfno) 
    tweet_dfn(sincer_id_dfn,tweetcnt_dfno);
  }
  else
  {
    tweetfi <- rbind(tweetfi, tweet_dfno) 
    print("finished")
    attach(tweetfi)
    df <- tweetfi[order(created_at),]
  }
}

  tweetfi <- rbind(tweet_df, tweet_df2) 
  tweet_dfn(sincer_id_df2,tweetcnt_df2);

}else
{
  tweetfi <- rbind(tweet_df, tweet_df2)
  print("finished")
  attach(tweetfi)
  df <- tweetfi[order(created_at),]
}
save(df, file=paste0("tweetdt/data_",make.names(Sys.time()), ".Rda"))






