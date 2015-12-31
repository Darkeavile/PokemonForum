class AddLastPostAndTotalPostsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :lastpost, :integer
    add_column :profiles, :totalposts, :integer
  end
end
