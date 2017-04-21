class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :number
      t.string :organisation

      t.timestamps null: false
    end
  end
end
