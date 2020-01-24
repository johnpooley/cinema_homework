require('pg')

class Customer

  attr_accessor :name, :funds
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  # CRUD

def save()
  sql = "INSERT INTO customers (name, funds)
          VALUES ($1,$2,$3)
          RETURNING id"
  values = [@name, @funds]
  customer = SqlRunner.new(sql, values).first
  @id = customer['id'].to_i
end




end
