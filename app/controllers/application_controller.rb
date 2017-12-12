require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all

    erb :index
  end

  get '/posts' do
    Post.all
  end

  post '/posts/new' do
    @post = Post.create(params[:name],params[:content])

    erb :new
  end

  post 'posts/:id' do
    @current = Post.find(:id)

    erb :show
  end
end
