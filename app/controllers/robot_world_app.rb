require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  enable :method_override

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot = Robot.new(params[:robots])
    robot.save
    redirect '/robots'
  end

  get '/robots/:id' do
    @robot = Robot.find(params[:id])
    erb :show
  end

  get '/robots/:id/edit' do
    @robot = Robot.find(params[:id])
    erb :edit
  end

  put '/robots/:id' do
    @robot = Robot.find(params[:id])
    @robot.update(params[:robots])
    redirect "/robots/#{params[:id]}"
  end

  delete '/robots/:id' do |id|
    Robot.destroy(id.to_i)
    redirect "/robots"
  end
end
