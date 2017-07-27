class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_loc
  before_action :set_adm_class

  def datos
  end

  protected
  def set_loc
    locs = {admin1: "Ixtlilco el grande, Tepalcingo", admin2: "Jantetelco, Jantetelco", admin3: "Marcelino Rodiguez, Axochiapán", admin4: "San Gabriel Amacuitlapiclo, Jonacatepec", admin5: "Tetela del volcán"}
    @loc = locs[current_admin.usuario.to_sym]
  end

  def set_adm_class
    h_class = {admin1: "ixtlilco", admin2: "jantetelco", admin3: "marcelino", admin4: "san-gabriel", admin5: "tetela"}
    @class = h_class[current_admin.usuario.to_sym]
  end
end
