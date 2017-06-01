class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :properties, [:user_id, :created_at]
  end
end
