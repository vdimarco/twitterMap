
# Source the function
source("http://biostat.jhsph.edu/~jleek/code/twitterMap.R")

reqURL <- "http://api.twitter.com/oauth/request_token"
accessURL <- "http://api.twitter.com/oauth/access_token"
authURL <- "http://api.twitter.com/oauth/authorize"
ck <- 'cmxCCQCSzjz9RQ8UOkv7g'
cs <- 'ptvTcfzGBupFeGbgceK4UAmUoesbiV5dEvmZ94dOPVU'

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

twitCred <- OAuthFactory$new(consumerKey=ck,
                             consumerSecret=cs,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL)
twitCred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
registerTwitterOAuth(twitCred)

# getTwitterOAuth(ck, cs)

# Make your twittermap
twitterMap("vdimarco")

#If your location can't be found or latitude longitude can't be calculated
#choose a bigger city near you. The list of cities used by twitterMap
#can be found like so:
data(world.cities)
grep("Montreal",world.cities[,1])

# Then make the map using that big city
twitterMap("simplystats",userLocation="Baltimore")

#If you want both your followers and people you follow in a plot you can do:
twitterMap("simplystats",plotType="both")