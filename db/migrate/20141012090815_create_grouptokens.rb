class CreateGrouptokens < ActiveRecord::Migration
  def change
    create_table :grouptokens do |t|
      t.text :token
      t.timestamps
    end
  end
end
