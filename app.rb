require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/HoundCloud.rb'

class App < Sinatra::Base
  get '/' do
    erb :index 
  end

  get '/get' do
    @artist = @params[:artist]
    @tracks = HoundCloud.getArtist(@params[:artist])
    erb :result
  end

  post '/auth' do
    redirect HoundCloud.scAuth
  end
end
