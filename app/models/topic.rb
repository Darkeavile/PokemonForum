class Topic < ActiveRecord::Base
	belongs_to :forum
  	belongs_to :user
  	has_many :replies

  	before_destroy :delete_replies

  	private
  		def delete_replies
  			self.replies.destroy_all
  		end

end
