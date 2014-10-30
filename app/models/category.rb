class Category < ActiveRecord::Base
  has_many :issue_categoryships
  has_many :issues, :through => :issue_categoryships
end
