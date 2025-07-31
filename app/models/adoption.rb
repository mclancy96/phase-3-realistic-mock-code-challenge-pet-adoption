class Adoption < ActiveRecord::Base
  belongs_to :adopter
  belongs_to :shelter

  def adopted_pet?(pet_name)
    Adoption.exists?(adopter_id: self.id, pet_name: pet_name)
  end

  def transfer_adoption(new_adopter, adoption)
    if adoption.adopter_id == self.id
      adoption.update(adopter_id: new_adopter.id)
    end
  end
end
