require('pg')
require('pry')
require_relative('db/sql_runner.rb')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

Film.delete_all
Customer.delete_all
Ticket.delete_all

film1=Film.new({'title' => 'The Matrix', 'price' => '5'})
film2=Film.new({'title' => 'High Fidelity', 'price' => '6'})
film3=Film.new({'title' => 'Nosferatu', 'price' => '7'})
film1.save
film2.save
film3.save

customer1=Customer.new({'name' => 'Steve', 'funds' => '20'})
customer2=Customer.new({'name' => 'Bill', 'funds' => '45'})
customer3=Customer.new({'name' => 'Jess', 'funds' => '30'})
customer4=Customer.new({'name' => 'Mark', 'funds' => '115'})
customer1.save
customer2.save
customer3.save
customer4.save

ticket1=Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket2=Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket3=Ticket.new({'film_id' => film2.id, 'customer_id' => customer1.id})
ticket4=Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})
ticket5=Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id})
ticket6=Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id})
ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save



binding.pry
nil
