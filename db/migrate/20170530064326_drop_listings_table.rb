class DropListingsTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :listings
  end
end
