class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.string :article
      t.string :url
      t.text :comment
      t.string :image_id
      t.string :text

      t.timestamps
    end
  end
end
