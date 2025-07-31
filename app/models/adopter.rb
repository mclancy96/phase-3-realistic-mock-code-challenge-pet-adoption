class Adopter < ActiveRecord::Base
  has_many :adoptions
  has_many :shelters, through: :adoptions

  def shelter
    Shelter.find(self.shelter_id)
  end

  def adopter
    Adopter.find(self.adopter_id)
  end
end
