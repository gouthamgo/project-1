class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :image
      t.text :name
      t.text :description
      t.float :price
      t.integer :user_id
      t.timestamps
    end
  end
end
