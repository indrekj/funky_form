class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :author
      t.string :title
      t.text :body
      t.integer :priority

      t.timestamps
    end
  end
end
