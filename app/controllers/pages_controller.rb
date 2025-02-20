class PagesController < ProtectedResourceController
  def index
    render "pages/dashboard"
  end
end