require 'models/task_manager'
require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true #this is funcationality that comes with sinatra

  get '/' do
    erb :dashboard
  end

  get '/tasks' do #this has to do with Read
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do  #this has to do with Create
    erb :new
  end

  post '/tasks' do  #this has to do with create
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id| #this has to do with Read
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id'do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect '/tasks'
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do
  erb :error
  end


end
