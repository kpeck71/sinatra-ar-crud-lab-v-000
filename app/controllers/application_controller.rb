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

  get '/posts/new' do
    Post.create(params)
    erb :new
  end

  get 'posts/:id' do
    @post = Post.find(:id)

    erb :show
  end
end
