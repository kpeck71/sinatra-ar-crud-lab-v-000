require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  post '/posts/new' do

    erb :new
  end

  post 'posts/:id' do
    @current = Post.find(:id)

    erb :show
  end
end
