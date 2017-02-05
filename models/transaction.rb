require('pg')
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :amount, :tag, :merchant_id 

  def initialize(options)
    @id = nil || options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @amount = options['amount'].to_f
    @tag = options['tag']
  end

  # Save new records to the transactions table

  def save()
    sql = "INSERT INTO transactions (merchant_id, amount, tag) VALUES (#{@merchant_id}, #{@amount}, '#{@tag}') RETURNING *;"
    data = SqlRunner.run(sql)
    @id = data.first()['id'].to_i
  end

# Delete all records from the transactions table

  def self.delete_all() 
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

# View all records from the transactions table

  def self.all()
    sql = "SELECT * FROM transactions"
    result = Transaction.get_many(sql)
    return result
  end

# Loop through all the transactions

  def self.get_many(sql)
    trans = SqlRunner.run(sql)
    result = trans.map { |tran| Transaction.new( tran ) }
    return result
  end

# Get the total of all transactions

  def self.get_total()
    sql = "SELECT sum( amount ) FROM transactions"
    result = SqlRunner.run(sql)
    # result = trans.map { |tran| Transaction.new( tran ) }
    # result = Transaction.get_many(sql)
    return result
  end

end