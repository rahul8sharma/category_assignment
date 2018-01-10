class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.integer :parent_id

      t.timestamps
    end
    add_index :categories, [:parent_id, :id], unique: true
  end
end
