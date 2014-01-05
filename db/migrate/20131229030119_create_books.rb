class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :title_array
      t.string :authors
      t.text :authors_array
      t.string :publisher
      t.string :published_date
      t.text :description
      t.integer :isbn
      t.integer :page_count
      t.string :categories
      t.float :average_rating
      t.integer :ratings_count
      t.string :language
      t.string :preview_link
      t.string :info_link
      t.string :image_link

      t.timestamps
    end
  end
end
