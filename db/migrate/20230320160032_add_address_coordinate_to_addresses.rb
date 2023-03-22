class AddAddressCoordinateToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :address_coordinates, null: true, foreign_key: true
  end
end
