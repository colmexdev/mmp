class InicioController < ApplicationController
  before_action :authenticate_user!, only: [:inicio_usr,:formulario,:crear_formulario,:respuesta]
  before_action :set_localidad, only: [:formulario,:crear_formulario,:respuesta]
  before_action :set_class, only: [:inicio_usr,:formulario,:crear_formulario,:respuesta]

  def inicio
  end

  def formulario
    @form = DatosUser.new
  end

  def crear_formulario
    @form = DatosUser.new(form_params)
    respond_to do |format|
      if (!form_params[:email].empty? || !form_params[:telefono].empty?)
        @form.save
        format.html { redirect_to respuesta_path, notice: 'success' }
        #format.json { render :show, status: :created, location: @catedra }
      else
        format.html { redirect_to respuesta_path, notice: 'fail' }
        #format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def respuesta

  end

  def inicio_usr
    @lugares = {
			tepalcingo: ["Ixtlilco el grande, Tepalcingo", "La comida china es un distintivo de la comunidad (la mayoría retornados), destino principal para los migrantes: Minneapolis, Minnesota, día de plaza: miércoles. La gente en Ixtlilco es más abierta al compartir su historia, en su plaza hay una panadería montada en un puesto de tianguis."], 
			jantetelco: ["Jantetelco, Jantetelco","Lugar conocido por Mariano Matamoros de quien aún se conserva su dormitorio y fue de gran importancia junto a Morelos en la zona durante la Independencia. Otro atractivo turístico es el ex convento de San Pedro Apóstol quien es el santo patrono de la comunidad. De todas las comunidades, la plaza de Jantetelco fue la más arreglada, tenía nacimiento, árbol navideño, piñatas."], 
			axochiapan: ["Marcelino Rodiguez, Axochiapán","Los lugareños prefieren llamarle por su nombre anterior \"San Ignacio\", alta incidencia en casas deshabitadas a las orillas del pueblo, por las mañanas los hombres mayores o jornaleros esperaban en una esquina a 2 cuadras del centro a la espera de trabajo. El mayor atractivo turístico es un balneario llamado \"Los Amates\"."], 
			jonacatepec: ["San Gabriel Amacuitlapilco, Jonacatepec","En SG se destaca el uso del perifoneo para matener a la comunidad en comunicación, su plaza generalemente estaba sola con respecto a las otras comunidades. Hay dos iglesias de las cuales de una resalta el color morado."], 
			tetela: ["Tetela del volcán","En Tetela los fines de semana las personas se juntan atrás de la escuela e intercambian sus productos, además de vender el típico \"pan de sal\". La vista del volcán Popocatépetl es hermosa y se puede notar entre los lugareños el orgullo de ser nativo del lugar; se distingue por su urbanización ya que es la única localidad con torres. El ex convento, forma parte de una ruta de conventos ubicados en las faldas del volcán."],
			peto: ["Peto","Lorem ipsum dolor sit amet"],
			santaelena: ["Santa Elena", "Lorem ipsum dolor sit amet"]}
    respond_to do |format|
      format.html
    end
  end

  protected

  def set_localidad
    locs = {tepalcingo: "Ixtlilco el grande, Tepalcingo", jantetelco: "Jantetelco, Jantetelco", axochiapan: "Marcelino Rodiguez, Axochiapán", jonacatepec: "San Gabriel Amacuitlapilco, Jonacatepec", tetela: "Tetela del volcán", peto: "Peto", santaelena: "Santa Elena"}
    @loc = locs[current_user.usuario.to_sym]
  end

  def set_class
    h_class = {tepalcingo: "ixtlilco", jantetelco: "jantetelco", axochiapan: "marcelino", jonacatepec: "san-gabriel", tetela: "tetela", peto: "peto", santaelena: "sta-elena"}
    @class = h_class[current_user.usuario.to_sym]
  end

  def form_params
    params.require(:datos_user).permit(:nombre, :email, :telefono, :pref, :localidad, :comentarios)
  end
end
