class AddColumnTypeToService < ActiveRecord::Migration
  def self.up
  	add_column :services, :type, :string
  end

  def self.down
  	remove_column :services, :type
  end
end
