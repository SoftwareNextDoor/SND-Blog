class UserFields < ActiveRecord::Migration
  def up
  	add_column :usrs, :nickname, :string
  	add_column :usrs, :picture, :string
  	add_column :usrs, :thumbnail, :string
  	add_column :usrs, :language, :string
  	add_column :usrs, :utcOffset, :integer
  	add_column :usrs, :last_modified_date, :datetime
  	add_column :usrs, :profile, :string
  	add_column :usrs, :active, :boolean
  	add_column :usrs, :user_type, :string
  	add_column :usrs, :last_status_body, :string
  	add_column :usrs, :last_status_created_date, :datetime
  	add_column :usrs, :admin, :boolean, :default => false
  	add_column :usrs, :email, :string
  	add_column :usrs, :name, :string
  end

  def down
   	remove_column :usrs, :nickname
  	remove_column :usrs, :picture
  	remove_column :usrs, :thumbnail
  	remove_column :usrs, :language
  	remove_column :usrs, :utcOffset
  	remove_column :usrs, :last_modified_date
  	remove_column :usrs, :profile
  	remove_column :usrs, :active
  	remove_column :usrs, :user_type
  	remove_column :usrs, :last_status_body
  	remove_column :usrs, :last_status_created_date
  	remove_column :usrs, :admin
  	remove_column :usrs, :email
  	remove_column :usrs, :name
  end
end
