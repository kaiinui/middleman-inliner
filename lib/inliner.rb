class Inliner < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end
  alias :included :registered

  helpers do
    def hoga
      "hugahuga!"
    end
  end
end

::Middleman::Extensions.register(:inliner, Inliner)