class CreateUserBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_banks do |t|
      t.string :card_expire
      t.string :card_number
      t.string :card_type
      t.string :currency
      t.string :iban

      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
