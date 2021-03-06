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

  #  create

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1,$2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end


  # read

  def self.all()
    sql = "RETURN customers.* FROM customers"
    customers = SqlRunner.run(sql)
    results = customers.map{|customer| Customer.new(customer)}
    return results
  end

  # update

  def update()
    sql = "UPDATE customers SET(name, funds)VALUES ($1,$2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  # delete

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ############################################################################


  def films

    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = $1"
    values = [@id]
    films_data = SqlRunner.run(sql, values)
    results = films_data.map{|film| Film.new(film)}
    return results
  end



end
