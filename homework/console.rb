
require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )
require_relative( 'models/screening')

require( 'pry' )
Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()

customer1 = Customer.new("name" => "craig", "funds" => 100)
customer1.save()
customer2 = Customer.new("name" => "Eilidh", "funds" => 120)
customer2.save()
customer3 = Customer.new("name" => "Bob", "funds" => 70)
customer3.save()

film1 = Film.new("title"=> "A Simple Favour", "price" => 10)
film1.save()
film2 = Film.new("title"=> "Ant-man and the Wasp", "price" => 10)
film2.save()
film3 = Film.new("title"=> "Blackkklansman", "price" => 10)
film3.save()
film4 = Film.new("title"=> "Crazy Rich Asians", "price" => 10)
film4.save()
film5 = Film.new("title"=> "Incredibles 2", "price" => 10)
film5.save()

screening1 = Screening.new("start_time"=> "20:00", "empty_seats" => 20, "film_id" => film1.id)
screening1.save()
screening2 = Screening.new("start_time"=> "19:30", "empty_seats" => 20, "film_id" => film3.id)
screening2.save()
screening3 = Screening.new("start_time"=> "10:00", "empty_seats" => 20, "film_id" => film5.id)
screening3.save()

ticket1 = Ticket.new("customer_id" => customer1.id, "screening_id" => screening2.id )
ticket1.save()
ticket2 = Ticket.new("customer_id" => customer2.id, "screening_id" => screening2.id )
ticket2.save()
ticket3 = Ticket.new("customer_id" => customer3.id, "screening_id" => screening3.id )
ticket3.save()


binding.pry
nil
