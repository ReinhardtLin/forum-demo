class Reply < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :issue
end
