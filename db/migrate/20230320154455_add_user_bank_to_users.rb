class AddUserBankToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :user_banks, null: true, foreign_key: true
  end
end
