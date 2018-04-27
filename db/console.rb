require('pry')

require_relative('../models/Customer')
require_relative('../models/Film')
require_relative('../models/Ticket')

Customer.delete_all()
Film.delete_all()

colin = Customer.new({
  "name" => "Colin",
  "funds" => 300
})

colin.save()

lebowski = Film.new({
  "title" => "The Big Lebowski",
  "price" => 4
})

lebowski.save()

ticket = Ticket.new({
  "film_id" => lebowski.id,
  "customer_id" => colin.id
})

ticket.save()

binding.pry
nil