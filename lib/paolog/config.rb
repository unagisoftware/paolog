require 'singleton'

module Paolog
  class Config
    include Singleton

    attr_accessor :allow_production_logs, :allowed_log_files, :user, :password

    def initialize
      @allow_production_logs = false
      @allowed_log_files     = %w(test development staging)
      @user                  = secrets.dig(:paolog,:user)
      @password              = secrets.dig(:paolog, :password)
    end

    def has_credentials?
      @user && @password
    end

    private

    def secrets
      manage_credentials? ?  Rails.application.credentials : Rails.application.secrets
    end

    def manage_credentials?
      Rails.application.respond_to? :credentials
    end

  end
end
