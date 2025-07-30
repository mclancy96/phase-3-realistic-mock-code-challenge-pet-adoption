class Shelter < ActiveRecord::Base
  has_many :adoptions
  has_many :adopters, through: :adoptions

  def process_adoption(adopter, pet_name, adoption_fee)
    # Your code here
  end

  def self.oldest_shelter
    # Your code here
  end

end
