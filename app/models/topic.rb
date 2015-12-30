class Topic < ActiveRecord::Base
	belongs_to :forum
  	belongs_to :user
  	has_many :replies

  	before_destroy :delete_replies

  	private
  		def delete_replies
  			self.reply.destroy_all
  		end

end
