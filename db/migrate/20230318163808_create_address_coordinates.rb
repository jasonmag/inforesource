class CreateAddressCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :address_coordinates do |t|
      t.string :lat
      t.string :lng

      t.references :address, index: true, foreign_key: true

      t.timestamps
    end
  end
end
