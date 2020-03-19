require 'sinatra/base'
require './lib/space'
require './lib/user'
require 'date'


class DreamBnB < Sinatra::Base

  get '/test' do
    'Test page'
  end


  get '/add-space' do
    erb :add_space
  end

  post '/new-space' do
    @space = Space.create(space_name: params[:name], space_description: params[:description], space_price: params[:price],
      from_date: params[:from], to_date: params[:to])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces

  end

  get '/' do
    erb :"sign_up"
  end


  post '/' do
    @user = User.create(user_name: params[:user_name], password: params[:password])
    redirect '/spaces'
  end

  get '/calendar/:id' do
    @requested_space = Space.select_by_id(id: params[:id]).first
    p id: params[:id]
    @from_date = (Date.parse(@requested_space.from_date))
    @to_date = (Date.parse(@requested_space.to_date))
    @date_array = (@from_date..@to_date)
    erb :calendar
  end

  post '/bookings' do
    # push every param into an array
    # push array into postgres
    # booking table we want dates, space_renter, space_id foreign key - id?,
    # make a space id when we create a space
    # space table add a space owner
    p 'bookings'
  end

  run! if app_file == $0
end
