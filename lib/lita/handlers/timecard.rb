module Lita
  module Handlers
    class Timecard < Handler
      # insert handler code here

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

      def add_time(entry)
      end

      def error_time_format(response)
      end

      def error_unknown_command(response)
      end

      def error(message)
      end

      Lita.register_handler(self)
    end
  end
end
