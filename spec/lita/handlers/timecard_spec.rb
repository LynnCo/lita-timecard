require "spec_helper"

describe Lita::Handlers::Timecard, lita_handler: true do

  {
    "timecard 2h" => :add_hours,
  }.each do |command, method|
    it { is_expected.to route_command(command).to(method) }
  end

end
