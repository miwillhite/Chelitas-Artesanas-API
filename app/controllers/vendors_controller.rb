class VendorsController < ApplicationController
  def index
    @vendors = Vendor.includes(:stockings)
    respond_with @vendors
  end
end
