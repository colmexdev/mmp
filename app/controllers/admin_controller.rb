class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_loc
  before_action :set_adm_class

  def datos
    @datos = DatosUser.where("localidad = ?",@loc)
  end

  protected
  def set_loc
    locs = {adminixtlilco: "Ixtlilco el grande", adminjantetelco: "Jantetelco", adminmarcelino: "Marcelino Rodiguez", adminsangabriel: "San Gabriel", admintetela: "Tetela", adminpeto: "Peto", adminsantaelena: "Santa Elena", adminpurisima: "Purísima", adminlagunita: "La Lagunita"}
    @loc = locs[current_admin.usuario.to_sym]
  end

  def set_adm_class
    h_class = {adminixtlilco: "ixtlilco", adminjantetelco: "jantetelco", adminmarcelino: "marcelino", adminsangabriel: "san-gabriel", admintetela: "tetela", adminpeto: "peto", adminsantaelena: "sta-elena", adminpurisima: "Purísima", adminlagunita: "lagunita"}
    @class = h_class[current_admin.usuario.to_sym]
  end
end
