class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :user_id
      t.boolean :owner
      t.timestamps
    end
  end
end
