class StockingSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :brewery_id, :vendor_id
end
