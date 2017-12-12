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

  post '/posts/new' do
    @post = Post.new(params)

    erb :new
  end

  post 'posts/:id' do
    @current = @posts.find(:id)

    erb :show
  end
end
