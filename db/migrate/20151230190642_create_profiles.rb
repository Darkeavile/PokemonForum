class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :image
      t.boolean :url
      t.text :about
      t.text :signature
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
