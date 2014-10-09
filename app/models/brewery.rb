require 'addressable/uri'

class Brewery < ActiveRecord::Base
  include Contactable
  has_many :stockings, dependent: :destroy, autosave: true
  has_many :vendors, -> { uniq }, through: :stockings
end
