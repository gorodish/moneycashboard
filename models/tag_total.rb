require('pg')
require_relative('../db/sql_runner')

class TagTotal

  attr_reader :amount, :tag

  def initialize(options)
    @amount = options['amount']
    @tag = options['tag']
  end

  def self.tag_list_with_totals
    sql = "SELECT tag, sum(amount) AS amount FROM transactions GROUP BY tag;"
    tag_total =  SqlRunner.run(sql)
    result = tag_total.map { |tot| TagTotal.new( tot ) }
    return result
  end
  
end