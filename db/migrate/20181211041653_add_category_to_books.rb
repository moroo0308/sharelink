class AddCategoryToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :category, :integer
  end
end
