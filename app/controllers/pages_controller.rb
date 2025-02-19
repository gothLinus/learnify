class PagesController < ApplicationController
  def index
    render "pages/dashboard"
  end
end