class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :addresses, null: true, foreign_key: true
  end
end
