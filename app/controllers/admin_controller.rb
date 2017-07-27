class AdminController < ApplicationController
  before_action :authenticate_admin!

  def datos
  end
end
