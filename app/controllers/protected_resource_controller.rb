# frozen_string_literal: true

class ProtectedResourceController < ApplicationController
  before_action :authenticate_user!
end
