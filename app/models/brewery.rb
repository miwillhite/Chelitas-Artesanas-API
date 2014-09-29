require 'addressable/uri'

class Brewery < ActiveRecord::Base
  has_many :stockings, dependent: :destroy, autosave: true
  has_many :vendors, -> { uniq }, through: :stockings

  def url
    Addressable::URI.parse(read_attribute(:url))
  end
end
