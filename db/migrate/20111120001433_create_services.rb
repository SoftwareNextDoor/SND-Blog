class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|

      t.timestamps
    end
  end
end
