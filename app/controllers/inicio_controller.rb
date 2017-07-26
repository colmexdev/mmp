class InicioController < ApplicationController
  before_action :authenticate_user!, only: [:inicio_usr]

  def inicio
  end

  def inicio_usr
    @lugar = "Algo"
    @desc_lugar = "Otro algo"

    respond_to do |format|
      format.html
    end
  end
end
