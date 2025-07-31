class Shelter < ActiveRecord::Base
  has_many :adoptions
  has_many :adopters, through: :adoptions

  def process_adoption(adopter, pet_name, adoption_fee)
  Adoption.create(
    adopter_id: adopter.id,
    shelter_id: self.id,
    pet_name: pet_name,
    adoption_fee: adoption_fee
  )
  end

  def self.oldest_shelter
    Shelter.order(founded_year: :asc).first
  end
end
