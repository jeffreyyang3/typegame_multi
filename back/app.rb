require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'json'
require 'sinatra-websocket'

set :server, 'thin'
set :sockets, []
set :bind, '0.0.0.0'
state = { :messages => [] }

get '/hello' do
  "hello changed2"
end


get '/x' do
  ob = {:x => :y, :z => "asdf"}
  json ob
end


get '/ws' do
  request.websocket do |ws|
    ws.onopen do
      ws.send('yo4')
      settings.sockets << ws
    end
    # ws.onmessage do |msg|
    #   puts msg
    # end
    ws.onmessage do |msgJson|
      parse = JSON.parse msgJson
      state[:messages].push parse['el']
      puts state
    end
  end
end
