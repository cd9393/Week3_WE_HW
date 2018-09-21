require_relative("../db/sql_runner")

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["title"]
    @screening_id = options["price"]
  end

  def save()
    sql = "INSERT INTO films(title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map{|film| Film.new(film)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end
end
