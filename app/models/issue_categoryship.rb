class IssueCategoryship < ActiveRecord::Base
  belongs_to :issue
  belongs_to :category
end
