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
    user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
    if user.save && user.username != "" && user.email != ""
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  get '/signup' do
    if helpers.logged_in?
      redirect '/tweets'
    end
      erb :'users/create_user'
  end

  get '/tweets' do
    erb :'tweets/tweets'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
