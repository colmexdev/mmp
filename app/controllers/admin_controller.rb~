class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_loc
  before_action :set_adm_class

  def datos
    @datos = DatosUser.where("localidad = ?",@loc)
  end

  protected
  def set_loc
    locs = {adminixtlilco: "Ixtlilco el grande, Tepalcingo", adminjantetelco: "Jantetelco, Jantetelco", adminaxochiapan: "Marcelino Rodiguez, Axochiapán", adminsangabriel: "San Gabriel Amacuitlapilco, Jonacatepec", admintetela: "Tetela del volcán", adminpeto: "Peto", adminsantaelena: "Santa Elena"}
    @loc = locs[current_admin.usuario.to_sym]
  end

  def set_adm_class
    h_class = {adminixtlilco: "ixtlilco", adminjantetelco: "jantetelco", adminaxochiapan: "marcelino", adminsangabriel: "san-gabriel", admintetela: "tetela", adminpeto: "peto", adminsantaelena: "sta-elena"}
    @class = h_class[current_admin.usuario.to_sym]
  end
end
