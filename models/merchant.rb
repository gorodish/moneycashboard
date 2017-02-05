require('pg')
require_relative('../db/sql_runner')

class Merchant

  attr_reader :id
  attr_accessor :name, :linkref

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @linkref = options['linkref'].to_i
  end

# Save new records to the merchants table

  def save()
    sql = "INSERT INTO merchants (name, linkref) VALUES ('#{@name}', '#{@linkref}') RETURNING *;"
    data = SqlRunner.run(sql)
    @id = data.first()['id'].to_i
  end

# Delete all records from the merchants table

  def self.delete_all() 
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

# View all records from the merchants table

  def self.all()
    sql = "SELECT * FROM merchants"
    result = Merchant.get_many(sql)
    return result
  end

# Loop through all the merchants

  def self.get_many(sql)
    merchant = SqlRunner.run(sql)
    result = merchant.map { |merch| Merchant.new( merch ) }
    return result
  end

end