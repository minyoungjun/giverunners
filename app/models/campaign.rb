class Campaign < ActiveRecord::Base
  belongs_to :user
  has_attached_file :logo, :styles => { :medium => "200x200>", :thumb => "50x50>" }, :default_url => "/images/logo_thumb.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
