# frozen_string_literal: true

require "cinch"
require "cinch/plugins/basic_ctcp"

require_relative "voyagerbot/version"
require_relative "plugins/auto_op"
require_relative "plugins/voyager_reply"
require_relative "plugins/voyager_ingress"

module Voyagerbot
  class Error < StandardError; end
end
