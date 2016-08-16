module Lita
  module Handlers
    class Timecard < Handler
      config :support

      route %r{^timecard (\d+)\s*h}i,
        :add_hours, command: true

      route %r{^timecard (\d+)\s*m}i,
        :add_minutes, command: true

      route %r{^timecard (\d+)(.*)}i,
        :error_time_format, command: true

      route %r{^timecard (.*)}i,
        :error_unknown_command, command: true

      def add_hours(response)
        add_time(response, response.matches[1].to_f)
      end

      def add_minutes(response)
        add_time(response, response.matches[1].to_f./(60.0).round(2))
      end

      def add_time(response, time_spent)
        activity = response.args[0]
        response.reply("logged! (#{time_spent}) work on (activity)")
      end

      def error_time_format(response)
        error(response, "#{response.matches[1]} is an invalid time format")
      end

      def error_unknown_command(response)
        error(response, "#{response.message.body} is not a valid command")
      end

      def error(response, message)
        if not config.support.nil?
          support = " -- see #{config.support} for support issues"
        else
          support = ""
        end
        response.reply("#{message}#{support}")
      end

      Lita.register_handler(self)
    end
  end
end
