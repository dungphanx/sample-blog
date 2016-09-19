class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :commenter, class_name: 'User'
  paginates_per 10
  
  def self.lastest_comments
		order('created_at desc')
	end
end
