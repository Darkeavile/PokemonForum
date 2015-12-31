class AddRoleplayingToForum < ActiveRecord::Migration
  def change
    add_column :forums, :roleplaying, :boolean
  end
end
