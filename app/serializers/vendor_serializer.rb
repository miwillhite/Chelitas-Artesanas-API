class VendorSerializer < ActiveModel::Serializer
  attributes :id, :title, :lat, :lon

  has_many :stockings
  has_many :breweries

  embed :ids, include: true
end
