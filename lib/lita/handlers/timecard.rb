module Lita
  module Handlers
    class Timecard < Handler
      config :support

      patterns = {
        hours:    %r/(\d+)\s*h/i,
        minutes:  %r/(\d+)\s*m/i,
      }
      all_patterns_regex = patterns.values.join('|')

      route %r/^timecard #{patterns[:hours]}/i,
        :add_hours, command: true

      route %r/^timecard #{patterns[:minutes]}/i,
        :add_minutes, command: true

      route %r/^timecard (?!#{all_patterns_regex})(.*)/i,
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
