#' Get basic info of an User
#'
#'
##'function to get basic info of an user
#'@param user_id user id
#'@param token An OAuth token created with \code{spotifyOAuth}.
#' @examples \dontrun{
#' ## Example
#'  my_oauth <- spotifyOAuth(app_id="xxxx",client_id="yyyy",client_secret="zzzz")
#'  save(my_oauth, file="my_oauth")
#'  load("my_oauth")
#'  tiago <- getUser(user_id="t.mendesdantas",token=my_oauth)
#' }
#'
#'
#'@export
#'
#function to retrieve information about a user
#information about an user
addTracksToPlaylist<-function(user_id,playlist_id, track_id, token){
	track_uri <- paste0("spotify:track:", track_id)

	track_uri <- RCurl::curlEscape(track_uri) #Credit: http://stackoverflow.com/questions/8031370/encode-a-query-string-in-r
  req <- httr::POST(paste0("https://api.spotify.com/v1/users/",user_id,"/playlists/",playlist_id,"/tracks?uris=",track_uri), httr::config(token = token))
  json1<-httr::content(req)
  return(json1)
}


