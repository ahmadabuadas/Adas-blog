class AddNameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text
   
  end
end
