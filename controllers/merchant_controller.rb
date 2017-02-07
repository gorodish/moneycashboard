require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )

get '/merchants' do
  @zombies = Merchant.all()
  erb ( :"merchants/index" )
end