class Category < ActiveRecord::Base
	has_many :forum

	before_destroy :delete_forums

	private
		def delete_forums
			self.forum.destroy_all
		end
end
