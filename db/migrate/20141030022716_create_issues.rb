class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :topic
      t.text :content
      t.boolean :is_public
      t.integer :capacity

      t.timestamps
    end
  end
end
