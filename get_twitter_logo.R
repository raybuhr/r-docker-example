library(httr)
library(jsonlite)

base_url <- "https://api.twitter.com/1.1/"

make_oauth_secret <- function(consumer_key, consumer_secret) {
  secret <- base64_enc(paste(consumer_key, consumer_secret, sep = ":"))
  paste("Basic", gsub("\n", "", secret))
}

req_token <- POST("https://api.twitter.com/oauth2/token",
                  add_headers("Authorization" = make_oauth_secret(Sys.getenv("TW_CONSUMER_KEY"), Sys.getenv("TW_CONSUMER_SECRET")),
                              "Content-Type" = "application/x-www-form-urlencoded;charset=UTF-8"),
                  body = "grant_type=client_credentials")

stop_for_status(req_token, "Authenticate with Twitter")

token <- paste("Bearer", content(req_token)$access_token)

example_request <- GET(url = paste0(base_url, "users/show.json"),
                       query = list(screen_name="twitterdev"),
                       add_headers(Authorization = token))

resp <- fromJSON(content(example_request, as = "text"))

print("Image URL:")
print(resp$profile_image_url)
print("Background Image URL:")
print(resp$profile_background_image_url_https)
