class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :issue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
