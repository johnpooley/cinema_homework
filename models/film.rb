require('pg')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  # CRUD

  def save()
    sql = "INSERT INTO films (title, price)
            VALUES ($1,$2)
            RETURNING id"
    values = [@title, @price]
    film = SqlRunner.new(sql, values).first
    @id = film['id'].to_i
  end



end
