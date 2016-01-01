class Group < ActiveRecord::Base
	has_many :users, :through => :groupmemberships
  	has_many :groupmemberships
end
