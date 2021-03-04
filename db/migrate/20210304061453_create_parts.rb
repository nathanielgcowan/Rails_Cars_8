class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :user_id
      t.integer :car_id
      t.integer :rating

      t.timestamps
    end
  end
end
