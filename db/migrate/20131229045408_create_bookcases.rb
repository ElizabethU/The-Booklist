class CreateBookcases < ActiveRecord::Migration
  def change
    create_table :bookcases do |t|
      t.string :name
      t.string :user_id

      t.timestamps
    end
  end
end
