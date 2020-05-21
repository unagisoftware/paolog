module Paolog
  class ApplicationController < ::ApplicationController
    http_basic_authenticate_with name: Paolog.config.user, password: Paolog.config.password
  end
end
