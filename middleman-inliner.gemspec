Gem::Specification.new do |s|
  s.name        = 'middleman-inliner'
  s.version     = '1.0.0'
  s.date        = '2014-06-22'
  s.summary     = "Inline JS and CSS in just one line."
  s.description = "Inline JS and CSS in just one line."
  s.authors     = ["Kai Inui"]
  s.email       = 'me@kaiinui.com'
  s.files       = ["lib/middleman-inliner.rb", "lib/middleman_extension.rb"]
  s.homepage    = 'https://github.com/kaiinui/middleman-inliner'
  s.license     = 'MIT'

  s.add_dependency 'middleman-core', '~> 4.1.9'
  s.add_dependency 'middleman-cli', '~> 4.1.9'
end
