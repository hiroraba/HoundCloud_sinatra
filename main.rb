require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index 
end

get '/get' do
  @artist = @params[:artist]
  erb :result
end
