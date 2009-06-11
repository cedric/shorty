class Url < ActiveRecord::Base
  
# CALLBACKS
  after_create :save_token
  
# VALIDATIONS
  validates_presence_of :url
  validates_uniqueness_of :url, :token
  validates_format_of :url, :allow_blank => true, :with => /^((http|https):\/\/)*[a-z0-9_-]{1,}\.*[a-z0-9_-]{1,}\.[a-z]{2,4}\/*$/i
  
  private
  
    def save_token
      update_attributes( :token => id.base_encode(62) )
    end
  
end
