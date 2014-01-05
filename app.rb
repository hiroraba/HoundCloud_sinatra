require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/getArtist.rb'

class App < Sinatra::Base
  get '/' do
    erb :index 
  end

  get '/get' do
    @artist = @params[:artist]
    @tracks = getArtist(@params[:artist])
    erb :result
  end

  get 'auth' do
  end
end

App.run!
