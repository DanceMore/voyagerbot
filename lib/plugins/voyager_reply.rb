require 'cinch'

class VoyagerReply
  include Cinch::Plugin

  match(/r (.*)/)
  def execute(m, msg)
    m.reply("voyager> #{msg}")
    bot.friend.Channel( config[:reply_to] ).send(msg)
  end
end
