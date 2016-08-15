module Lita
  module Handlers
    class Timecard < Handler
      # insert handler code here
      config :support

      route %r{^timecard \d+(?:h|hr|hour|m|min|minute)}i,
        :add_hours, command: true,

      route %r{^timecard \d+(?:m|min|minute)}i,
        :add_minutes, command: true,

      route %r{^timecard \d+(.*)}i,
        :error_time_format, command: true,

      route %r{^timecard (.*)}i,
        :error_unknown_command, command: true,

      def add_hours(response)
      end

      def add_minutes(response)
      end

      def add_time(minutes)
      end

      def error_time_format(response)
        error("`#{response.matches(1)} is an invalid time format`")
      end

      def error_unknown_command(response)
        error("`#{response.matches(1)} is not a valid command`")
      end

      def error(response, message)
        response.reply("#{message} -- see #{config.support} for support issues")
      end

      Lita.register_handler(self)
    end
  end
end
