require 'sinatra'
set :bind, '0.0.0.0'

get '/hello' do
  "hello world"
end
