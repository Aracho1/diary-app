require 'sinatra/base'
require './lib/diary'
require './lib/comment'
require './database_connection_setup'

class DiaryApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @diary = Diary.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/add' do
    Diary.add(title: params[:title], entry: params[:entry])
    redirect '/'
  end

  get '/:id' do
    @diary = Diary.find(id: params[:id])
    erb :entry
  end

  get '/:id/edit' do
    @diary = Diary.find(id: params[:id])
    erb :edit
  end

  patch '/:id' do
    Diary.edit(id: params[:id], title: params[:title], entry: params[:entry])
    redirect '/'
  end

  patch '/:id/comment' do
    Diary.add_comments(diary_id: params[:id], comment: params[:comment])
    redirect('/')
  end

  delete '/:id/delete' do
    Diary.delete(id: params[:id])
    redirect '/'
  end
end