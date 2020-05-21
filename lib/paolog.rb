require 'paolog/engine'

module Paolog
  autoload :LogReader, 'paolog/log_reader'
  autoload :LogColorize, 'paolog/log_colorize'
  autoload :Config, 'paolog/config'

  def self.config
    Config.instance
  end
end
