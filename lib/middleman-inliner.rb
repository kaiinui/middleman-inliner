require 'middleman-core'

class Inliner < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super

    app.compass_config do |config|
      config.output_style = :compressed
    end
  end

  helpers do
    def inline_css(*names)
      names.map { |name|
        name += ".css" unless name.include?(".css")
        css_full = sprockets.find_asset(name).to_s
        
        compressor = ::Sass::SCSS::CssParser.new(css_full, name, 1).parse
        compressor.options = {:style => :compressed}
        css_compressed = compressor.render.strip
        
        "<style type='text/css'>#{css_compressed}</style>"
      }.reduce(:+)
    end

    def inline_js(*names)
      names.map { |name|
        name += ".js" unless name.include?(".js")
        js = sprockets.find_asset(name).to_s
        "<script type='text/javascript'>#{defined?(Uglifier) ? Uglifier.compile(js) : js}</script>"
      }.reduce(:+)
    end

    alias :inline_javascript :inline_js
    alias :inline_js_tag :inline_js
    alias :inline_javascript_tag :inline_js
    alias :javascript_inline_tag :inline_js
    alias :js_inline_tag :inline_js

    alias :inline_stylesheet :inline_css
    alias :inline_css_tag :inline_css
    alias :inline_stylesheet_tag :inline_css
    alias :stylesheet_inline_tag :inline_css
    alias :css_inline_tag :inline_css
  end
end

Inliner.register(:inliner)
