require('pg')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

############################################################################
  # CRUD

  # create
  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ($1,$2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.new(sql, values).first
    @id = film['id'].to_i
  end

  # read

  def self.all()
    sql = "RETURN films.* FROM films"
    films = SqlRunner.new(sql)
    results = films.map{|film| Film.new(film)}
    return results
  end


  #  update

  def update()
    sql = "UPDATE films SET(title, price)VALUES ($1,$2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.new(sql, values)
  end

  # delete

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.new(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = (@id)
    SqlRunner.new(sql, values)
  end

############################################################################



end
