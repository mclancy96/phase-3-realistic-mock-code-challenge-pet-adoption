class Adopter < ActiveRecord::Base
  has_many :adoptions
  has_many :shelters, through: :adoptions


end
