class Forum < ActiveRecord::Base
  belongs_to :category
  has_many :topics

  before_destroy :destroy_topics

  private
  	def destroy_topics
  		self.topics.destroy_all
  	end
end
