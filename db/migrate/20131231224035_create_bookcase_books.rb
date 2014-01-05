class CreateBookcaseBooks < ActiveRecord::Migration
  def change
    create_table :bookcase_books do |t|
      t.integer :book_id
      t.integer :bookcase_id

      t.timestamps
    end
  end
end
