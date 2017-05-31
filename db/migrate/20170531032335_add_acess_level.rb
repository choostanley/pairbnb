class AddAcessLevel < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :access_level, :integer, default: 0

  	add_column :listings, :verified, :integer, default: 0
  end
end
