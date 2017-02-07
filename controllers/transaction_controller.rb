require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )

get '/transactions' do
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @transactions = Transaction.all()
  erb ( :"transactions/new" )
end

# send form using post - create
post '/transactions/create' do 
  @transaction = Transaction.new(params)
  @transaction.save
  erb(:"transactions/create")
end

# get a transaction by id
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

# Edit a transaction by id
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end


# update a transaction by id
post '/transactions/:id' do
  @transaction = Transaction.update(params)
  redirect to ("/transactions/#{params[:id]}")
end

# delete a transaction by id
post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to ('/transactions')
end