# Pet Adoption Center - Solution

## Models and Associations

### `Adoption` Model

```ruby
class Adoption < ActiveRecord::Base
  belongs_to :shelter
  belongs_to :adopter

  def print_details
    "#{adopter.name} adopted #{pet_name} from #{shelter.name}"
  end
end
```

### `Shelter` Model

```ruby
class Shelter < ActiveRecord::Base
  has_many :adoptions
  has_many :adopters, through: :adoptions

  def process_adoption(adopter, pet_name, adoption_fee)
    adoptions.create(
      adopter: adopter,
      pet_name: pet_name,
      adoption_fee: adoption_fee
    )
  end

  def self.oldest_shelter
    order(:founded_year).first
  end
end
```

### `Adopter` Model

```ruby
class Adopter < ActiveRecord::Base
  has_many :adoptions
  has_many :shelters, through: :adoptions

  def adopted_pet?(pet_name)
    adoptions.any? { |adoption| adoption.pet_name == pet_name }
    # Alternative solution using ActiveRecord:
    # adoptions.exists?(pet_name: pet_name)
  end

  def transfer_adoption(adopter, adoption)
    adoption.update(adopter: adopter)
  end
end
```

## Migration

### `CreateAdoptions`

```ruby
class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.string :pet_name
      t.integer :adoption_fee
      t.integer :adopter_id
      t.integer :shelter_id
    end
  end
end
```

## Example Usage

```ruby
# Create instances
shelter = Shelter.create(name: "Happy Paws Shelter", founded_year: 2010)
adopter = Adopter.create(name: "Sarah Johnson")

# Process an adoption
adoption = shelter.process_adoption(adopter, "Fluffy", 75)

# Check if adopter has adopted a specific pet
adopter.adopted_pet?("Fluffy") # => true
adopter.adopted_pet?("Max") # => false

# Print adoption details
adoption.print_details # => "Sarah Johnson adopted Fluffy from Happy Paws Shelter"

# Find oldest shelter
Shelter.oldest_shelter # => returns shelter with earliest founded_year

# Transfer adoption
new_adopter = Adopter.create(name: "Mike Williams")
adopter.transfer_adoption(new_adopter, adoption)
adoption.reload.adopter.name # => "Mike Williams"
```

## Key ActiveRecord Methods Used

- **Associations**: `has_many`, `belongs_to`, `has_many through`
- **Queries**: `order`, `first`, `any?`, `exists?`
- **Persistence**: `create`, `update`
- **Traversal**: Direct association access (e.g., `adoption.adopter`, `shelter.adoptions`)

## Notes

- The `adopted_pet?` method can be implemented in multiple ways - using Ruby's `any?` method or ActiveRecord's `exists?` method
- The `transfer_adoption` method updates the existing record rather than creating a new one
- The `process_adoption` method creates the adoption through the shelter's association, automatically setting the `shelter_id`
- The `oldest_shelter` class method uses ActiveRecord's `order` method to sort by founded year and returns the first result
