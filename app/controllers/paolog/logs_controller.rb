module Paolog
  class LogsController < ApplicationController
    before_action :check_env
    before_action :check_auth

    layout 'paolog/application'

    def index
      @lines = reader
        .read(params[:limit].to_i)
        .map! { |line| colorizer.colorize_line(line).html_safe }
    end

    private

    def reader
      Paolog::LogReader.new
    end

    def colorizer
      Paolog::LogColorize.new
    end

    def check_env
      raise unless Paolog.config.allowed_log_files.include?(Rails.env)
    end

    def check_auth
      raise 'Logs not allowed on production environment.' if Rails.env.production? && !Paolog.config.allow_production_logs
      raise 'You have to set user and password on your secrets/credentials' unless Paolog.config.has_credentials?
    end
  end
end
