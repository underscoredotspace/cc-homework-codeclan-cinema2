require_relative('../db/SqlRunner')

class Customer
  attr_reader :id
  attr_accessor :name, :funds
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  def films()
    sql = "SELECT films.* FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      WHERE tickets.customer_id = $1;"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    return Film.map_items(film_hashes)
  end

  def save()
    sql = "INSERT INTO customers (name, funds) 
      VALUES ($1, $2) 
      RETURNING id;"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    SqlRunner.run("DELETE FROM customers WHERE id = $1;", [@id])
  end

  def self.map_items(items)
    items.map { |item| self.new(item)}
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM customers;")
  end
end