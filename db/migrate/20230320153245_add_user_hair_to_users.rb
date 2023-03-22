class AddUserHairToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :user_hairs, null: true, foreign_key: true
  end
end
