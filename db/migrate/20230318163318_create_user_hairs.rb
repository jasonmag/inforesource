class CreateUserHairs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_hairs do |t|
      t.string  :color
      t.string  :type_name

      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
