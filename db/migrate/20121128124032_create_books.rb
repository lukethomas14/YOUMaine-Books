class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :email
      t.string :price

      t.timestamps
    end
  end
end
