class BrewerySerializer < ActiveModel::Serializer
  attributes :id, :name, :url

  def url
    object.url.to_s
  end
end
