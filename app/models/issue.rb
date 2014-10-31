class Issue < ActiveRecord::Base
  validates_presence_of :topic
  has_many :replies

  has_many :issue_categoryships
  has_many :categories, :through => :issue_categoryships

  belongs_to :user
end
