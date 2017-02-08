require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag_total.rb' )
require_relative( '../models/transaction.rb' )

get '/spending' do
  @tags = TagTotal.tag_list_with_totals()
  @tran = Transaction.get_total()
  @budget = Transaction.budget()
  erb ( :"spending/index" )
end