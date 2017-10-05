class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :price

      t.timestamps
    end
  end
end
