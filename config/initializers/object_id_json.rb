# added this patch as per https://github.com/rails-api/active_model_serializers/issues/354

# objects id was returned as {'_id':{"$oid": "12313123"}}, & changelog was explaining this as

# Moped's BSON implementation has been removed in favor of the 10gen
# bson gem 2.0 and higher. All `Moped::BSON` references should be changed
# to just `BSON`.

module BSON
  class ObjectId
    alias :to_json :to_s
    alias :as_json :to_s
  end
end
