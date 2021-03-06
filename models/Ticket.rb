require_relative('../db/SqlRunner')

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"].to_i
    @film_id = options["film_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) 
      VALUES ($1, $2) 
      RETURNING id;"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    SqlRunner.run("DELETE FROM tickets WHERE id = $1;", [@id])
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM tickets;")
  end
end