class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.references :adopter, foreign_key: true
      t.references :shelter, foreign_key: true
    end
  end
end
