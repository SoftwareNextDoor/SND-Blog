class ServiceFields < ActiveRecord::Migration
  def self.up
  	add_column :services, :instance_url, :string
  	add_column :services, :org_id, :string
  	add_column :services, :user_type, :string
  	add_column :services, :active, :boolean
  	add_column :services, :last_status_update, :string
  	add_column :services, :last_status_created_date, :datetime
    add_column :services, :profile, :string
    add_column :services, :usr_id, :integer
    add_column :services, :provider, :string
    add_column :services, :uid, :string
    add_column :services, :uname, :string
    add_column :services, :uemail, :string
    add_column :services, :token, :string
    add_column :services, :token_refresh, :string
  end

  def self.down
  	remove_column :services, :instance_url
  	remove_column :services, :org_id
  	remove_column :services, :user_type
  	remove_column :services, :active
  	remove_column :services, :last_status_update
  	remove_column :services, :last_status_created_date
    remove_column :services, :profile
    remove_column :services, :usr_id
    remove_column :services, :provider
    remove_column :services, :uid
    remove_column :services, :uname
    remove_column :services, :uemail
    remove_column :services, :token
    remove_column :services, :token_refresh
  end
end
