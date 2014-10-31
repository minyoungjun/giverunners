class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.text  :pledge
      t.timestamps
    end
  end
end
