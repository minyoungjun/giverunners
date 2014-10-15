class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.string  :title
      t.text  :content
      t.integer :amount
      t.datetime :give_date
      t.timestamps
    end
  end
end
