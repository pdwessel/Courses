library(httr)

oauth_endpoints("github")

my_app <- oauth_app("First App", key = "30fdaed55a8f6e18af85", secret = "c968adfa7cca98241a9a52374900934c50ae0336")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)


