class AddZipToBooks < ActiveRecord::Migration
  def change
    add_column :books, :zip, :string
  end
end
