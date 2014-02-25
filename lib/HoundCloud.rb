require 'json'
require 'net/https'
require 'soundcloud'

class HoundCloud
  def initialize(token)
    @client = Soundcloud.new(:access_token => token)
  end

  def getArtist(artist)
    tracks = @client.get('/tracks', :limit => 10, :order => 'hotness', :q => artist)
  end

  def playlist(token, trackid)
    playlist = @client.get('/me/playlists').first
    track_ids = playlist.tracks.map(&:id)
    track_ids << trackid
    tracks = track_ids.map{|id| {:id => id}}
    playlist = @client.put(playlist.uri, :playlist => {:tracks => tracks })
  end
end
