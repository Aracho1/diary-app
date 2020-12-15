require 'sinatra/base'
require './lib/diary'
require './database_connection_setup'

class DiaryApp < Sinatra::Base

  before do
    @diary = Diary.instance
  end

  get '/' do
    @diary = Diary
    erb :index
  end

  post '/add' do
    @diary.add(params[:title], params[:entry])
    redirect '/'
  end

  get '/entry' do
    p params[:title]
    p @diary.find_entry('today')
    @entry = @diary.find_entry(params[:title])
    erb :entry
  end
end