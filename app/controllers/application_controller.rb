require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "victorias"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  post '/signup' do
    redirect '/tweets'
  end

  get '/signup' do
    erb :'users/create_user'
  end

  get '/tweets' do
    erb :'tweets/tweets'
  end
end
