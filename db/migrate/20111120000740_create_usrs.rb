class CreateUsrs < ActiveRecord::Migration
  def change
    create_table :usrs do |t|

      t.timestamps
    end
  end
end
