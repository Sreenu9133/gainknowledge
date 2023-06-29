class RemoveColumnFromCourse < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :c_category, :string
  end
end
