require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  get '/' do
    erb :index 
  end

  get '/get' do
    @artist = @params[:artist]
    erb :result
  end
end

App.run!
