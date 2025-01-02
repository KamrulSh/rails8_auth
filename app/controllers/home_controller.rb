class HomeController < ApplicationController
  allow_unauthenticated_access(only: :index)
  def index
  end

  def dashboard
    redirect_to sign_in_url unless authenticated?
  end
end
