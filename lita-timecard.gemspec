Gem::Specification.new do |spec|
  spec.name          = "lita-timecard"
  spec.version       = "0.1.0"
  spec.authors       = ["Lynn 'Cyrin' Conway"]
  spec.email         = ["lynncyrin@gmail.com"]
  spec.description   = "Timecards for Lita"
  spec.summary       = "Allows users to create timecard with entries like 10m, 2h"
  spec.homepage      = "https://github.com/LynnCo/lita-timecard"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"

  spec.add_development_dependency "bundler"
end
