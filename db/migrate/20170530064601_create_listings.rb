class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.string :price
      t.integer :num_of_bed
      t.string :address

      t.timestamps
    end
  end
end
