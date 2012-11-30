class AddCoursetoBooks < ActiveRecord::Migration
  def up
  	add_column :books, :course_number, :string
  end

  def down
  end
end
