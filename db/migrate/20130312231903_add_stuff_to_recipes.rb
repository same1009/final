class AddStuffToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :directions, :text
  end
end
