class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.boolean :user_type
      t.string :fname
      t.string :lname
      t.string :country
      t.string :city
      t.date :DOB
      t.string :gender
      t.string :contact
      t.string :mail

      t.timestamps
    end
  end
end
