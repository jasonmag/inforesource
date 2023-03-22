class CreateAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_name
      t.string :city
      t.string :postal_code
      t.string :state

      t.timestamps
    end
  end
end
