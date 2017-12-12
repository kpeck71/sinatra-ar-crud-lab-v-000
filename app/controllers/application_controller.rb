require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = []
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    new_post = Post.create(params)
    new_post.save

    #redirect to('/posts')
  end

  get 'posts/:id' do
    @post = Post.find(:id)

    erb :show
  end

  get '/posts/:id/edit' do
    erb :edit
  end

  patch '/posts/:id' do

  end

end
