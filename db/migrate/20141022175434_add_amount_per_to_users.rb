class AddAmountPerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amount_per, :integer
  end
end
