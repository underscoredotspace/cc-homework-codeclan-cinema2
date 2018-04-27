require_relative('../db/SqlRunner')

class Film
  attr_reader :id
  attr_accessor :title, :price
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) 
      VALUES ($1, $2) 
      RETURNING id;"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    SqlRunner.run("DELETE FROM films WHERE id = $1;", [@id])
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM films;")
  end
end