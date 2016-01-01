class User < ActiveRecord::Base
  has_many :topics
  has_many :replies
  has_many :groups, :through => :groupmemberships
  has_many :groupmemberships
  belongs_to :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def add_group(group, role)
    self.groupmemberships.build(:group => group, :role => role)
  end
end
