puts "🌱 Seeding data..."

# Create shelters
happy_paws = Shelter.create(name: "Happy Paws Shelter", founded_year: 2010)
rescue_me = Shelter.create(name: "Rescue Me Animal Center", founded_year: 2005)
second_chance = Shelter.create(name: "Second Chance Pet Rescue", founded_year: 2015)
city_animal = Shelter.create(name: "City Animal Shelter", founded_year: 1998)

# Create adopters
sarah = Adopter.create(name: "Sarah Johnson")
mike = Adopter.create(name: "Mike Williams")
lisa = Adopter.create(name: "Lisa Chen")
david = Adopter.create(name: "David Rodriguez")

# Create adoptions
Adoption.create(pet_name: "Fluffy", adoption_fee: 75, adopter: sarah, shelter: happy_paws)
Adoption.create(pet_name: "Max", adoption_fee: 100, adopter: mike, shelter: rescue_me)
Adoption.create(pet_name: "Bella", adoption_fee: 50, adopter: lisa, shelter: second_chance)
Adoption.create(pet_name: "Charlie", adoption_fee: 125, adopter: david, shelter: city_animal)
Adoption.create(pet_name: "Luna", adoption_fee: 75, adopter: sarah, shelter: rescue_me)
Adoption.create(pet_name: "Cooper", adoption_fee: 100, adopter: mike, shelter: happy_paws)

puts "✅ Done seeding!"
