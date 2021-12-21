require 'cinch'

class VoyagerIngress
  include Cinch::Plugin

  listen_to :channel, :join, :leaving, method: :relay

  def relay(m, user = nil)
    warn "[+] probe sensor detecting."

    line = m

    # stolen switch statement lel
    if line.events.include?(:join)
      tempMessage = Format(:green, ">> %s has joined" % [line.user])
    elsif line.events.include?(:part)
      tempMessage = Format(:brown, "<< %s has parted (%s)" % [line.user, line.message])
    elsif line.events.include?(:quit)
      tempMessage = Format(:brown, "<< %s has quit (%s)" % [line.user, line.message])
    elsif line.events.include?(:kick)
      tempMessage = Format(:orange, "<! %s has kicked %s (%s)" % [line.user, user, line.message])
    elsif line.events.include?(:kill)
      tempMessage = Format(:orange, "<< %s was killed by %s (%s)" % [user, line.user, line.message])
    elsif line.events.include?(:action)
      tempMessage = Format(:blue, "*%s %s" % [line.user, line.action_message])
    elsif line.events.include?(:channel)
      tempMessage = "<%s> %s" % [line.user, line.message]
    end

    bot.friend.Channel( config[:reply_to] ).send(tempMessage)
  end
end
