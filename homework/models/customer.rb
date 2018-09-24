require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name , :funds
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end

  def save()
    sql = "INSERT INTO customers(name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    casting = SqlRunner.run(sql, values).first
    @id = casting["id"].to_i
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM
     screenings INNER JOIN tickets ON screenings.id = tickets.screening_id INNER JOIN films ON film_id = films.id
     WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map{|film| Film.new(film)}
    return result
  end

  def tickets()
    sql = "SELECT * FROM tickets where customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql,values)
    results = tickets.map{|ticket| Ticket.new(ticket)}
    return results
  end

  def tickets_bought()
    tickets.count
  end

  def pay_ticket(price)
    @funds -= price
  end

  def buy_ticket(screening)
    sql =  "SELECT films.* FROM
     screenings INNER JOIN films ON film_id = films.id WHERE films.id = $1"
     values = [screening.film_id]

     film_at_screening = SqlRunner.run(sql,values)
     result = film_at_screening.first
     price =  result["price"].to_i
     if @funds > price && screening.seats_available
       pay_ticket(price)
       screening.sell_ticket
       return "Ticket successfully purchased"
     else
       return "Unsuccessful"
     end 
  end

  def self.get_by_id(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first
    return Customer.new(result)
  end


  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end
