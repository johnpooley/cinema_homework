require('pg')

class Ticket

  attr_accessor :film_id, :customer_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @customer_id = options['customer_id']
  end
end
