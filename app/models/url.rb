class Url < ActiveRecord::Base
  
  after_create :save_token
  
  validates_presence_of :url
  validates_uniqueness_of :url, :case_sensitive => false
  validates_uniqueness_of :token
  validates_format_of :url, :allow_blank => true, :with => /^((http|https):\/\/)*[a-z0-9_-]{1,}\.*[a-z0-9_-]{1,}\.[a-z]{2,4}\/*$/i
  
  private
  
    def save_token
      update_attributes( :token => Base52.encode(id) )
    end
  
end
