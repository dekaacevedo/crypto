class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  require 'net/http'
  require 'json'
end
