class Blog < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :creator_id, :title, :body, presence: true
  has_many :comments, dependent: :destroy
  paginates_per 10
  
  def self.lastest_blog
		order('created_at desc')
	end
end
