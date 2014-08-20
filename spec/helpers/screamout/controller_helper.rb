module ControllerHelper
  def include_engine_routes
    routes do
      Screamout::Engine.routes
    end
  end
end
