class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :replier_id, limit: 8, null: false
      t.integer :question_id, limit: 8, null: false

      t.timestamps
    end

    add_foreign_key :replies, :users, column: :replier_id
    add_foreign_key :replies, :questions
  end
end
