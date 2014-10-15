class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string  :user_id
      t.integer :amount
      t.datetime :run_time
      t.string  :title
      t.text  :content
      t.timestamps
    end
  end
end
