require 'active_support'
require 'xmlsimple'

def vendors_from_kml(kml_file_name)
  kml = XmlSimple.xml_in(kml_file_name, { 'KeyAttr' => 'name' })
  placemarks = kml['Document'].map { |d| d['Placemark'] }.first
  vendors_hash = placemarks.map do |p|
    coords = p['Point'][0]['coordinates'][0]
    lon, lat, _ = coords.split(',')
    name = p['name'][0]
    {
      name: name,
      lat: lat,
      lon: lon
    }
  end
end

breweries = [
  {
    name: 'Abysmo'
  },
  {
    name: 'Andes Brewing',
    contact_attributes: {
      url: 'http://andesbrewing.com'
    }
  },
  {
    name: 'Averno Brewery'
  },
  {
    name: 'Bandido Brewing',
    contact_attributes: {
      url: 'http://bandidobrewing.com'
    }
  },
  {
    name: 'Cervecería Cerro Negro'
  },
  {
    name: 'Cervecería Gourmet Ecuatoriana'
  },
  {
    name: 'Cerveza Ballesta',
    contact_attributes: {
      url: 'https://www.facebook.com/cervezaballesta'
    }
  },
  {
    name: 'Cerveza Quilago'
  },
  {
    name: 'Cherusker',
    contact_attributes: {
      url: 'https://www.facebook.com/CheruskerCerveceriaAlemana'
    }
  },
  {
    name: 'Del Galpón Cerveza',
    contact_attributes: {
      url: 'https://www.facebook.com/pages/Cerverza-Artesanal-El-Galpon/126109564242567'
    }
  },
  {
    name: 'Doggerlander',
    contact_attributes: {
      url: 'http://doggerlander.com'
    }
  },
  {
    name: 'Java Cerveza',
    contact_attributes: {
      url: 'https://www.facebook.com/java.cerveza'
    }
  },
  {
    name: 'La Compañia Brewpub',
    contact_attributes: {
      url: 'https://www.facebook.com/pages/La-Compa%C3%B1ia-Brewpub/1412739842295936'
    }
  },
  {
    name: 'La Cuchara de San Marcos',
    contact_attributes: {
      url: 'https://www.facebook.com/lacuchara.desanmarcos'
    }
  },
  {
    name: 'Los 3 Monjes',
    contact_attributes: {
      url: 'http://los3monjes.com'
    }
  },
  {
    name: 'Monkey\'s Brew',
    contact_attributes: {
      url: 'https://www.facebook.com/pages/Monkeys-Brew-Cerveza-Artesanal/577932098930980'
    }
  },
  {
    name: 'Paramo Brauhaus',
    contact_attributes: {
      url: 'http://paramo.com.ec'
    }
  },
  {
    name: 'Quinde Brewery',
    contact_attributes: {
      url: 'https://www.facebook.com/QuindeBrewery'
    }
  },
  {
    name: 'Red Dragon Brewing',
    contact_attributes: {
      url: 'https://www.facebook.com/reddragonbrew'
    }
  },
  {
    name: 'Santana Brewing Company',
    contact_attributes: {
      url: 'https://www.facebook.com/pages/Santana-Brewing-Company/473535349351777'
    }
  },
  {
    name: 'Shaman Cerveza',
    contact_attributes: {
      url: 'https://www.facebook.com/ShamanCervezaArtesanal'
    }
  },
  {
    name: 'Sinners Brewery',
    contact_attributes: {
      url: 'https://www.facebook.com/SinnersBrewery'
    }
  },
  {
    name: 'Camino del Sol Brewery',
    contact_attributes: {
      url: 'https://www.facebook.com/pages/Camino-del-SOL-Cerveza-Artesanal/697681843628792'
    }
  },
  {
    name: 'Vendetta Cervecería Artesanal',
    contact_attributes: {
      url: 'https://www.facebook.com/CerveceriaArtesanalQuito'
    }
  }
]

def random_time
  rand(1.year.ago..1.day.ago)
end

def random_instance(klass)
  offset = rand(klass.count)
  klass.offset(offset).first
end

def create(klass, data, opts = {})
  data.each do |d|
    criteria = {}
    if attribute_name = opts[:find_by]
      criteria[attribute_name] = d.delete(attribute_name)
    else
      criteria = d
    end
    klass.send(:create_with, d).find_or_create_by(criteria)
  end
end

create Vendor, vendors_from_kml('./data/SINNERSubicaciones.kml'), find_by: :name
create Brewery, breweries, find_by: :name

100.times do
  Stocking.create({
    brewery:    random_instance(Brewery),
    vendor:     random_instance(Vendor),
    created_at: random_time
  })
end
