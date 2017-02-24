#' Get basic info of the current user
#'
#'
##'function to get basic info of the current user
#'@param user_id user id
#'@param token An OAuth token created with \code{spotifyOAuth}.
#' @examples \dontrun{
#' ## Example
#'  my_oauth <- spotifyOAuth(app_id="xxxx",client_id="yyyy",client_secret="zzzz")
#'  save(my_oauth, file="my_oauth")
#'  load("my_oauth")
#'  tiago <- getCurrentUser(user_id="t.mendesdantas",my_oauth)
#' }
#'
#'
#'@export
#'
#function to retrieve information about the current user
# https://developer.spotify.com/web-api/get-current-users-profile/
#information about the current user
getCurrentUserPlaylists<-function(token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/me/playlists"), httr::config(token = token))
  json1<-httr::content(req)
  json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))$items
  return(json2[,c("id","name","href")])
}


