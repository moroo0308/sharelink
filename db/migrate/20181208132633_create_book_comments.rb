class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :comment

      t.timestamps
    end
  end
end
