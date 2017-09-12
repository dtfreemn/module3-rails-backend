class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, limit: 8, null: false
      t.integer :reply_id, limit: 8, null: false
      t.boolean :positive, null: false, default: true

      t.timestamps
    end

    add_foreign_key :likes, :users
    add_foreign_key :likes, :replies
  end
end
