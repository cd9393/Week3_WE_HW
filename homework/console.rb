
require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry' )

Customer.delete_all

customer1 = Customer.new("name" => "craig", "funds" => 100)
customer2 = Customer.new("name" => "Eilidh", "funds" => 120)
customer3 = Customer.new("name" => "Bob", "funds" => 70)




binding.pry
nil
