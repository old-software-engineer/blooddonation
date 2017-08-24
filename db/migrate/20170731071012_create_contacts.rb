class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
    	t.string  :name
      t.string  :email
      t.date    :date_of_birth
      t.string  :contact_number
      t.string  :location
      t.string  :blood_group
      t.integer :age
      t.date    :last_donated_at
      t.boolean :available_at_night
      t.string  :available_from
      t.string  :available_to

      t.timestamps
    end
  end
end
