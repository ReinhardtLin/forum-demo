class CreateIssueCategoryships < ActiveRecord::Migration
  def change
    create_table :issue_categoryships do |t|
      t.integer :issue_id
      t.integer :category_id

      t.timestamps
    end
  end
end
