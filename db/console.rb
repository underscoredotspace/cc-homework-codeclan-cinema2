require('pry')

require_relative('../models/Customer')
require_relative('../models/Film')
require_relative('../models/Ticket')

Customer.delete_all()
Film.delete_all()

bart = Customer.new({
  "name" => "Bart",
  "funds" => 300
})
bart.save()

lisa = Customer.new({
  "name" => "Lisa",
  "funds" => 234
})
lisa.save()

lebowski = Film.new({
  "title" => "The Big Lebowski",
  "price" => 4
})
lebowski.save()

pulpfiction = Film.new({
  "title" => "Pulp Fiction",
  "price" => 5
})
pulpfiction.save()

ticket1 = Ticket.new({
  "film_id" => lebowski.id,
  "customer_id" => bart.id
})
ticket1.save()

ticket2 = Ticket.new({
  "film_id" => pulpfiction.id,
  "customer_id" => bart.id
})
ticket2.save()

ticket3 = Ticket.new({
  "film_id" => pulpfiction.id,
  "customer_id" => lisa.id
})
ticket3.save()

p bart.films()
p lisa.films()

p lebowski.customers()
p pulpfiction.customers()

binding.pry
nil