class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.string :role
      t.string :scope
      t.date :joined_at

      t.timestamps null: false
    end
  end
end