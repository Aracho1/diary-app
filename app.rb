require 'sinatra/base'
require './lib/diary'
require './database_connection_setup'

class DiaryApp < Sinatra::Base

  # before do
  #   @diary = Diary.instance
  # end

  get '/' do
    @diary = Diary.all
    erb :index
  end

  post '/add' do
    @diary.add(params[:title], params[:entry])
    redirect '/'
  end

  get '/entry' do
    @title = @diary.find_title(params[:title])
    @entry = @diary.find_entry(params[:title])
    erb :entry
  end

end