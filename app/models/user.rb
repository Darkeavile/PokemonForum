class User < ActiveRecord::Base
  has_many :topics
  has_many :replies
  has_many :groups, :through => :group_memberships
  has_many :groupmemberships
  belongs_to :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def add_group(group, role = "member")
     self.groupmemberships.build(:group => group, :role => role)
   end
end
