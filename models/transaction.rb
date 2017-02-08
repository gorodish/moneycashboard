require('pg')
require_relative('../db/sql_runner')

class Transaction

  attr_accessor :amount, :tag, :merchant, :id, :tran_date

  def initialize(options)
    @id = nil || options['id'].to_i
    @merchant = options['merchant']
    @amount = options['amount'].to_f
    @tag = options['tag']
    @tran_date = options['tran_date']
  end

  # Save new records to the transactions table

  def save()
    sql = "INSERT INTO transactions (merchant, amount, tag, tran_date) VALUES ('#{@merchant}', #{@amount}, '#{@tag}', '#{@tran_date}') RETURNING *;"
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
    return result.first
  end

# Get a transaction by its id
  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id=#{id}"
    result = SqlRunner.run(sql)
    transaction = Transaction.new(result.first)
    return transaction
  end

# Update a transaction

  def self.update(options)
    sql = "UPDATE transactions SET
          merchant='#{options['merchant']}',
          amount='#{options['amount']}',
          tag='#{options['tag']}',
          tran_date='#{options['tran_date']}',
          WHERE id=#{options['id']};"
    SqlRunner.run(sql)
  end

# Delete a transaction

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id=#{id};"
    SqlRunner.run(sql)
  end

# Find out if you have exceede your budget
  def self.budget()
    limit = 500
    current_total = get_total()["sum"].to_i
    if current_total > limit
      return "You have gone over your budget of £#{limit}"
    end
  end

end
