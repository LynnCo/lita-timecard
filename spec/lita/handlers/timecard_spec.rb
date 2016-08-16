require "spec_helper"

describe Lita::Handlers::Timecard, lita_handler: true do

  {
    "timecard 2h"         => :add_hours,
    "timecard 2H"         => :add_hours,
    "timecard 2 h"        => :add_hours,
    "timecard 2hr"        => :add_hours,
    "timecard 2hours"     => :add_hours,
    "timecard 2m"         => :add_minutes,
    "timecard 2M"         => :add_minutes,
    "timecard 2 m"        => :add_minutes,
    "timecard 2mins"      => :add_minutes,
    "timecard 2minutes"   => :add_minutes,
    # "timecard 2n"         => :error_time_format,
    # "timecard 2cat"       => :error_time_format,
    # "timecard cat"        => :error_unknown_command,
  }.each do |command, method|
    it { is_expected.to route_command(command).to(method) }
  end

  it "echoes back to the user when new entries are created" do
    activity = "lita-timecard"
    time_spent = "1h"
    send_message("@lita timecard #{time_spent} #{activity}")
    expect(replies.last).to eq("#{user.name} logged! (#{time_spent}) work on (#{activity})")
  end

end
