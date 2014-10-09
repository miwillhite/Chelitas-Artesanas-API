class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :lon, :phone

  has_many :stockings
  has_many :breweries

  embed :ids, include: true

  def lat
    object.lat.to_f
  end

  def lon
    object.lon.to_f
  end
end
