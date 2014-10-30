class AddPledgePerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pledge, :text
  end
end
