class Stocking < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :brewery
end
