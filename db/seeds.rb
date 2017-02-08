require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag_total.rb')

require('pry-byebug')

Transaction.delete_all
Merchant.delete_all

# MERCHANTS..............................................................

# merchant1 = Merchant.new({
#   'name' => 'Tesco',
#   'linkref' => 1
#   })

# merchant1.save

# merchant2 = Merchant.new({
#   'name' => 'Amazon',
#   'linkref' => 2
#   })

# merchant2.save

# merchant3 = Merchant.new({
#   'name' => 'John Lewis',
#   'linkref' => 3
#   })

# merchant3.save

# merchant4 = Merchant.new({
#   'name' => 'PC World',
#   'linkref' => 4
#   })

# merchant4.save

# merchant5 = Merchant.new({
#   'name' => 'Miss Selfridge',
#   'linkref' => 5
#   })

# merchant5.save

# TRANSACTIONS..............................................................

tran1 = Transaction.new({
  'merchant' => 'Tesco',
  'amount' => 12.99,
  'tag' => 'Clothing',
  'tran_date' => "06/12/2016"
})

tran1.save

tran2 = Transaction.new({
  'merchant' => 'Emporio Armani',
  'amount' => 85.00,
  'tag' => 'Clothing',
  'tran_date' => "06/11/2016"
})

tran2.save

tran3 = Transaction.new({
  'merchant' => 'Asda',
  'amount' => 121.50,
  'tag' => 'Groceries',
  'tran_date' => "01/10/2016"
})

tran3.save

tran4 = Transaction.new({
  'merchant' => 'Lidl',
  'amount' => 11.32,
  'tag' => 'Groceries',
  'tran_date' => "8/22/2016"
})

tran4.save

tran5 = Transaction.new({
  'merchant' => 'Tesco',
  'amount' => 18.78,
  'tag' => 'Groceries',
  'tran_date' => "12/9/2016"
})

tran5.save

tran6 = Transaction.new({
  'merchant' => 'Lidl',
  'amount' => 75.01,
  'tag' => 'Groceries',
  'tran_date' => "12/31/2016"
})

tran6.save

tran6 = Transaction.new({
  'merchant' => 'Amazon',
  'amount' => 375.66,
  'tag' => 'Electronics',
  'tran_date' => "1/18/2016"
})

tran6.save

binding.pry

nil