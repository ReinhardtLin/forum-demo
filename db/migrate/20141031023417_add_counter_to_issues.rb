class AddCounterToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :replies_count, :integer, :default => 0
    add_column :issues, :view_count, :integer, :default => 0
  end
end
