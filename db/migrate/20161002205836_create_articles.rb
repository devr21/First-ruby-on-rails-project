class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :likes
      t.integer :comments
      t.string :user_id
      t.timestamps
    end
  end
end
