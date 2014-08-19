module Screamout
  class Engine < ::Rails::Engine
    isolate_namespace Screamout
    config.generators do |g|
      g.orm :mongoid
    end
  end
end
