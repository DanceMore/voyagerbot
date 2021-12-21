require 'cinch'

class AutoOp
  include Cinch::Plugin

  listen_to :join, :method => :auto_op

  def auto_op(m)
    if config[:channels].include?(m.channel)
      unless m.user.nick == bot.nick
        m.channel.op(m.user)
      end
    end
  end
end
