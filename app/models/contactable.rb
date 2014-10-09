module Contactable
  extend ActiveSupport::Concern

  included do
    has_one :contact, as: :contactable
    delegate :url, :phone, :email, to: :contact, allow_nil: true

    accepts_nested_attributes_for :contact, allow_destroy: true
  end
end
