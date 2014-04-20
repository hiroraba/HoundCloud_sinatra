require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

require 'soundcloud'
require 'omniauth'
require 'omniauth-soundcloud'

class Houndcloud < Sinatra::Base

  configure do
    enable :sessions
    use OmniAuth::Builder do
      provider "soundcloud", 
        ENV['CLIENT_ID_SC'], 
        ENV['SECRET_ID_SC']
    end
  end

  get '/' do
    erb :index 
  end

  get '/get' do
    resession
    @@client = Soundcloud.new(:access_token => session[:token])
    @tracks = @@client.get('/tracks', :limit => 10, :order => 'hotness', :q => @params[:artist])
    erb :result
  end

  get '/auth/soundcloud/callback' do
    auth = request.env['omniauth.auth']
    session[:token] = auth.credentials.token
    redirect "/"
  end

  get '/add/:id' do
    resession
    playlist = @@client.get('/me/playlists').first
    track_ids = playlist.tracks.map(&:id)
    track_ids << @params[:id]
    tracks = track_ids.map{|id| {:id => id}}
    playlist = @@client.put(playlist.uri, :playlist => {:tracks => tracks })
  end

  not_found do
      "Whoops! You requested a route that wasn't available."
  end

  def resession
    if session[:token].nil?
      redirect "/"
    end
  end
end
