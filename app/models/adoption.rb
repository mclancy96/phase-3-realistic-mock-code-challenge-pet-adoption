class Adoption < ActiveRecord::Base
  belongs_to :adopter
  belongs_to :shelter


end
