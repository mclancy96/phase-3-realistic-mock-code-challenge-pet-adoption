class Adopter < ActiveRecord::Base
  has_many :adoptions
  has_many :shelters, through: :adoptions

  def adopted_pet?(pet_name)
    # Your code here
  end

  def transfer_adoption(adopter, adoption)
    # Your code here
  end

end
