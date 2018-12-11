class RemoveTextFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :text, :string
  end
end
