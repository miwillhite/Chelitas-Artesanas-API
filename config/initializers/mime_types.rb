# Copy the original JSON string and synonyms
Mime::Type.class_eval { attr_reader :string, :synonyms }
synonyms = [Mime::JSON.string, *Mime::JSON.synonyms]

# Create a new JSON type with 'application/vnd.api+json' preferred
Mime::Type.unregister :json
Mime::Type.register 'application/vnd.api+json', :json, synonyms
