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
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect '/tweets'
    else
      redirect '/signup'
  end

  get '/signup' do
    erb :'users/create_user'
  end

  get '/tweets' do
    erb :'tweets/tweets'
  end
end
