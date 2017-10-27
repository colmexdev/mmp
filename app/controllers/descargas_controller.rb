class DescargasController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_local

  require 'csv'
 
  def mostrar
    respond_to do |format|
      format.html { send_tabla_pdf }
      format.csv { send_data a_csv, filename: "users-#{Date.current}.csv"}
    end
  end
 
  private
  def set_local
    locs = {admin1: "Ixtlilco el grande, Tepalcingo", admin2: "Jantetelco, Jantetelco", admin3: "Marcelino Rodiguez, Axochiapán", admin4: "San Gabriel Amacuitlapiclo, Jonacatepec", admin5: "Tetela del volcán"}
    @loc = locs[current_admin.usuario.to_sym]
  end

  def a_csv
    headers = %w{"Nombre","Correo","Teléfono","Medio","Localidad", "Fecha de ingreso"}
    (CSV.generate(headers: true) do |csv|
      csv << headers
      DatosUser.where("localidad = ?",@loc).each do |usr|
        csv << [usr.nombre,usr.email,usr.telefono,usr.pref,usr.localidad, usr.created_at]
      end
    end).encode("iso-8859-1")
  end
 
  def tabla_pdf
    datos = DatosUser.where("localidad = ?",@loc)
    Tabla.new(datos)
  end
 
  def send_tabla_pdf
    send_file tabla_pdf.a_pdf,
      filename: tabla_pdf.filename,
      type: "application/pdf",
      disposition: "attachment"
  end
end
