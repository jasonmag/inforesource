class CreateUserCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_companies do |t|
      t.string :department
      t.string :name
      t.string :title

      t.references :addresses, index: true, foreign_key: true

      t.timestamps
    end
  end
end
