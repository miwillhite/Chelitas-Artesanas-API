require 'addressable/uri'

class Contact < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  def url
    Addressable::URI.parse(read_attribute(:url))
  end
end
