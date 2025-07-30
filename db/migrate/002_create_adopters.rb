class CreateAdopters < ActiveRecord::Migration[6.1]

  def change
    create_table :adopters do |t|
      t.string :name
    end
  end

end
