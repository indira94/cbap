#Twitter 1 - Configure Tweets and Download them
#@dupadhyaya  #Working using my Keys
#Load libraries
library("curl")
library("twitteR")
library("ROAuth")
library("syuzhet") #library for sentiment analysis - comparison

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#https://apps.twitter.com/
#different for each account
consumerKey="6zMdnDinXnkNELBDfY65omETy"
consumerSecret="9JAhMGSIY0Zipk0xDnEUCVUFVtYfcMQMb1DPjOIQLqF7fcpxNU"
AccessToken="1071290513293221889-l3XsvxLZHrwZHnok8F3OjfgAyulltI"
AccessTokenSecret="iXM7bFvRNBY0l3n97ljXihNKGkV1T21wqLW02puRNYdmv"

#Common for all accounts except the keys

cred <- OAuthFactory$new(consumerKey=consumerKey, consumerSecret=consumerSecret, requestURL='https://api.twitter.com/oauth/request_token', accessURL='https://api.twitter.com/oauth/access_token', authURL='https://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem") # it will take you to browser: authorise, copy key and paste in R Studio at Console. Once it stores, it move to R prompt
save(cred, file="twitter authentication.Rdata") # store this to avoid asking again
#Load saved authentication cert
load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(consumerKey, consumerSecret, AccessToken, AccessTokenSecret)

#type 1 : Yes 
search.string <- "#businessanalytics"
#search.string <- "#marketinganalytics"

no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets
tweets[1:10]
#Another Topics
search.string <- "#indvsaus"
#search.string <- "#asiacup"

no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets[1:5]

#My Tweets : will change if you use your own account
homeTimeline(n=15)  #my tweets
mentions(n=15)   # my tags
mentions(n=5)

#for user - 
(tweets = userTimeline("samiksha04", n=10))
userTimeline("riddheishad", n=5)

#------------------------------------
?userTimeline
tweets = userTimeline("imVkohli", n=100)
#english
tweets[1:5]
n.tweet <- length(tweets)
n.tweet
tweets.df = twListToDF(tweets) 
head(tweets.df)
summary(tweets.df)

#Remove hashtags & unnecessary characters
tweets.df2 <- gsub("http.*","",tweets.df$text)
tweets.df2 <- gsub("https.*","",tweets.df2)
tweets.df2 <- gsub("#.*","",tweets.df2)
tweets.df2 <- gsub("@.*","",tweets.df2)

head(tweets.df2)
#-----
library("syuzhet") #library for sentiment analysis - comparison
word.df <- as.vector(tweets.df2)
emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tweets.df2, emotion.df) 
head(emotion.df2)

#-----
sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value == max(sent.value)]
most.positive
most.negative<- word.df[sent.value <= min(sent.value)] 
most.negative
sent.value

#-----
positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)
negative.tweets <- word.df[sent.value < 0] 
head(negative.tweets)
neutral.tweets <- word.df[sent.value == 0]
head(neutral.tweets)
#----
# Alternate way to classify as Positive, Negative or Neutral tweets
category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))
head(category_senti)
category_senti2 <- cbind(tweets,category_senti,sent.value) 
head(category_senti2)

#----
table(category_senti)

