# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_goes_rogue/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_goes_rogue'
  spec.version       = RubyGoesRogue::VERSION
  spec.authors       = ['Remco Peereboom']
  spec.email         = ['rpeereboom@gmail.com']

  spec.summary       = 'A little roguelike library for ruby'
  spec.homepage      = 'https://github.com/remcopeereboom/ruby_goes_rogue'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'gosu'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'flog'
  spec.add_development_dependency 'flay'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'coveralls'
end
