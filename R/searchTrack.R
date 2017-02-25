#' @title
#'Search for an specific Track
#'
#'
#'function to get basic info about a searched Track
#'@param trackName Name of the track
#' @examples \dontrun{
#' ## Example
#' search<-searchTrack("Foo+fighters")
#'
#' }
#'
#'
#'@export

#function to search for a specifc track
#note that if you don't provide a specifc name the function will return possible cases that match
#sorted by popularity
# Credit: https://raw.githubusercontent.com/tiagomendesdantas/Rspotify/master/R/searchArtist.R
# Credit: https://github.com/tiagomendesdantas/Rspotify/blob/master/R/getTrack.R

searchTrack<-function(trackName){
  req<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/search?q=", gsub(' ', '+', trackName),"&type=track"))
  tracks<-data.frame(req$tracks$items[,c("id","name","popularity","type")], album = req$tracks$items$album$name)
  artists <- req$tracks$items$album$artists
  artists <- laply(artists, function(artist){return(artist = artist$name)})

  return(data.frame(tracks, artist=artists))
}