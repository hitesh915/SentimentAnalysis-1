library(twitteR)
library(ggplot2)
library(plyr)

# Load already saved authentication details file 
load("twitter authentication.Rdata")
source("ScoreSentiment.R")

# Register with twitter
registerTwitterOAuth(cred)

load("twitter authentication.Rdata")

pos = scan(file="positive-words.txt",what="charcter", comment.char=";")

neg = scan(file="negative-words.txt",what="charcter", comment.char=";")


subway.tweets = searchTwitter('@SUBWAY', n= 150, cainfo="cacert.pem", lang ="en")
subway.text = laply(subway.tweets, function(t) {t$getText()} )
subway.score = score.sentiment(subway.text, pos,neg)
subway.score$Restaurants = "Subway"

bk.tweets = searchTwitter('@BurgerKing', n= 150, cainfo="cacert.pem", lang ="en")
bk.text = laply(bk.tweets, function(t) {t$getText()} )
bk.score = score.sentiment(bk.text, pos,neg)
bk.score$Restaurants = "Burger King"

md.tweets = searchTwitter('@dominos', n= 150, cainfo="cacert.pem", lang ="en")
md.text = laply(md.tweets, function(t) {t$getText()} )
md.score = score.sentiment(md.text, pos,neg)
md.score$Restaurants = "Dominos"

dd.tweets = searchTwitter('@pizzahut', n= 150, cainfo="cacert.pem", lang ="en")
dd.text = laply(dd.tweets, function(t) {t$getText()} )
dd.score = score.sentiment(dd.text, pos,neg)
dd.score$Restaurants = "Pizza Hut"


#

subway.tweets = searchTwitter('@NationalPro', n= 1500, cainfo="cacert.pem", lang ="en")
subway.text = laply(subway.tweets, function(t) {t$getText()} )
subway.score = score.sentiment(subway.text, pos,neg)
subway.score$Restaurants = "National"

bk.tweets = searchTwitter('@Hertz', n= 1500, cainfo="cacert.pem", lang ="en")
bk.text = laply(bk.tweets, function(t) {t$getText()} )
bk.score = score.sentiment(bk.text, pos,neg)
bk.score$Restaurants = "Hertz"

md.tweets = searchTwitter('@Avis', n= 1500, cainfo="cacert.pem", lang ="en")
md.text = laply(md.tweets, function(t) {t$getText()} )
md.score = score.sentiment(md.text, pos,neg)
md.score$Restaurants = "Avis"

dd.tweets = searchTwitter('@enterprisecares', n= 1500, cainfo="cacert.pem", lang ="en")
dd.text = laply(dd.tweets, function(t) {t$getText()} )
dd.score = score.sentiment(dd.text, pos,neg)
dd.score$Restaurants = "Enterprise"

################################

all.score <- NULL

all.scores = rbind(subway.score, bk.score, md.score, dd.score)

ggplot(data = all.scores) + geom_bar(mapping=aes(x=score,fill=Restaurants), binwidth =1) +
  facet_grid(Restaurants~.) +theme_bw() + 
  scale_colour_hue()

  scale_fill_brewer(palette ="Blues")


scale_colour_continuous(low=light, high = Oragne\\)