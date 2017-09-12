class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :questioner_id, limit: 8, null: false
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end

    add_foreign_key :questions, :users, column: :questioner_id
  end
end
