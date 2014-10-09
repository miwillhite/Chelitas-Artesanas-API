require 'active_support'

vendors = [
  {
    name: 'Brasil Delicatesen',
    lat: -0.165558,
    lon: -78.489117
  },
  {
    name: 'Taxi Licores',
    lat: -0.159737,
    lon: -78.490277
  }
]

breweries = [
  {
    name: 'Andes Brewing'
  },
  {
    name: 'Sinners Brewery'
  }
]

contacts = [
  {
    phone: '3123456'
  }
]

def random_time
  rand(1.year.ago..1.day.ago)
end

def random_instance(klass)
  offset = rand(klass.count)
  klass.offset(offset).first
end

def create(klass, data)
  data.each { |d| klass.send(:find_or_create_by, d) }
end

create Vendor, vendors
create Brewery, breweries
create Contact, contacts

5.times do
  Stocking.create({
    brewery:    random_instance(Brewery),
    vendor:     random_instance(Vendor),
    created_at: random_time
  })
end

contactable_vendor = random_instance(Vendor)
contactable_vendor.contact = random_instance(Contact)
contactable_vendor.save!
