
require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry' )

Customer.delete_all()
Film.delete_all()

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




binding.pry
nil
