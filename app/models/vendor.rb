class Vendor < ActiveRecord::Base
  include Contactable
  has_many :stockings, dependent: :destroy, autosave: true
  has_many :breweries, -> { uniq }, through: :stockings
end
