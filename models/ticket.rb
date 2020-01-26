require('pg')

class Ticket

  attr_accessor :film_id, :customer_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @customer_id = options['customer_id']
  end

  #  create

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id)
    VALUES ($1,$2)
    RETURNING id"
    values = [@film_id, @customer_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end


  # read

  def self.all()
    sql = "RETURN tickets.* FROM tickets"
    tickets = SqlRunner.run(sql)
    results = tickets.map{|ticket| Ticket.new(ticket)}
    return results
  end

# update

def update()
  sql = "UPDATE tickets SET(film_id, customer_id)VALUES ($1,$2) WHERE id = $3"
  values = [@film_id, @customer_id, @id]
  SqlRunner.run(sql, values)
end

 # delete

 def self.delete_all()
   sql = "DELETE FROM tickets"
   SqlRunner.run(sql)
 end

 def delete()
   sql = "DELETE FROM tickets WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

############################################################################





end
