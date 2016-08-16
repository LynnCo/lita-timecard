require "coveralls"
require "lita-timecard"
require "lita/rspec"

Coveralls.wear!

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
end
