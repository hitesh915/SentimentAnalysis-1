#=======================================================================================
## ON windows, we need to dowload the certificate for OAUTH
## NOTE:  you will need to setup an app on Twitter
## dev.twitter.com <- get your consumerKey/consumerSecret
#=======================================================================================

#=======================================================================================
## Load packages
#=======================================================================================

library("ROAuth")
library("twitteR")

#Windows users need to get this file 
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")


#=======================================================================================
## Authenticate with Twitter
#=======================================================================================

#create an object "cred" that will save the authenticated object that we can use for later sessions?registerTwitterOAuth
cred <- OAuthFactory$new(consumerKey='K2PWhPpVee1zO1WOHtDfw',
                         consumerSecret='cGQPJgsZwNUwIYqYwvBVlusfvSu2I7ZK62yxFBH2wM',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')
 
# will need to navigate to website and type in data to generate the file
# NOTE:  Only need to do this part once!!!
cred$handshake(cainfo="cacert.pem")

#save for later use for Windows
save(cred, file="twitter authentication.Rdata")

# Authenticate with Twitter
registerTwitterOAuth(cred)



