require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    Post.all

  end

  post '/posts/new' do
    @post = Post.new(params)

    erb :new
  end
end
