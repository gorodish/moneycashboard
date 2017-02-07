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
