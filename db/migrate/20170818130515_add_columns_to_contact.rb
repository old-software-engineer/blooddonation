class AddColumnsToContact < ActiveRecord::Migration[5.1]
  def change
  	add_column :contacts, :longitude, :decimal
  	add_column :contacts, :latitude, :decimal
  end
end
