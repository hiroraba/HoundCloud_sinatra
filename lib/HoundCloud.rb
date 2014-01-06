require 'json'
require 'net/https'
require 'soundcloud'

class HoundCloud 
  @client_id_sc = ENV['CLIENT_ID_SC']
  @secret_id_sc = ENV['SECRET_ID_SC']
  @redirect_url = 'http://localhost:4567'

  def self.getArtist(artist)
    client = SoundCloud.new(:client_id => @client_id_sc )
    tracks = client.get('/tracks', :limit => 10, :order => 'hotness', :q => artist)
  end

  def self.scAuth 
    client = Soundcloud.new(:client_id => @client_id_sc,
			    :client_secret => @secret_id_sc,
			    :redirect_uri => @redirect_url)
    client.authorize_url()
  end
end
