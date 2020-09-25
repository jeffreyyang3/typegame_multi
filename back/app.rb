require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'sinatra-websocket'

set :server, 'thin'
set :sockets, []
set :bind, '0.0.0.0'

get '/hello' do
  "hello dfdfd"
end


get '/x' do
  ob = {:x => :y, :z => "asdf"}
  json ob
end

get '/ws' do
  request.websocket do |ws|
    ws.onopen do
      ws.send('yo')
      settings.sockets << ws
    end
  end
end
