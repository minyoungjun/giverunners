class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.string  :title
      t.string  :category
      t.text  :content
      t.boolean :authorized
      t.string  :facebook_url
      t.string  :site_url
      t.timestamps
    end
  end
end
