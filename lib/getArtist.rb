require 'json'
require 'net/https'
require 'soundcloud'

def getArtist(artist)
  client = SoundCloud.new(:client_id => ENV['CLIENT_ID_SC'] )
  tracks = client.get('/tracks', :limit => 10, :order => 'hotness', :q => artist)
end
