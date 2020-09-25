require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
set :bind, '0.0.0.0'

get '/hello' do
  "hello dfdfd"
end


get '/x' do
  ob = {:x => :y, :z => "asdf"}
  json ob
end
