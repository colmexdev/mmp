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
      else
        format.html { redirect_to respuesta_path, notice: 'fail' }
      end
    end
  end

  def respuesta

  end

  def inicio_usr
    @lugares = {
			ixtlilco: ["Ixtlilco el grande", "La comida china es un distintivo de la comunidad (la mayoría retornados), destino principal para los migrantes: Minneapolis, Minnesota, día de plaza: miércoles. La gente en Ixtlilco es más abierta al compartir su historia, en su plaza hay una panadería montada en un puesto de tianguis."], 
			jantetelco: ["Jantetelco","Lugar conocido por Mariano Matamoros de quien aún se conserva su dormitorio y fue de gran importancia junto a Morelos en la zona durante la Independencia. Otro atractivo turístico es el ex convento de San Pedro Apóstol quien es el santo patrono de la comunidad. De todas las comunidades, la plaza de Jantetelco fue la más arreglada, tenía nacimiento, árbol navideño, piñatas."], 
			marcelinorodriguez: ["Marcelino Rodiguez","Los lugareños prefieren llamarle por su nombre anterior \"San Ignacio\", alta incidencia en casas deshabitadas a las orillas del pueblo, por las mañanas los hombres mayores o jornaleros esperaban en una esquina a 2 cuadras del centro a la espera de trabajo. El mayor atractivo turístico es un balneario llamado \"Los Amates\"."], 
			sangabriel: ["San Gabriel","En SG se destaca el uso del perifoneo para matener a la comunidad en comunicación, su plaza generalemente estaba sola con respecto a las otras comunidades. Hay dos iglesias de las cuales de una resalta el color morado."], 
			tetela: ["Tetela","En Tetela los fines de semana las personas se juntan atrás de la escuela e intercambian sus productos, además de vender el típico \"pan de sal\". La vista del volcán Popocatépetl es hermosa y se puede notar entre los lugareños el orgullo de ser nativo del lugar; se distingue por su urbanización ya que es la única localidad con torres. El ex convento, forma parte de una ruta de conventos ubicados en las faldas del volcán."],
			peto: ["Peto","Lorem ipsum dolor sit amet"],
			santaelena: ["Santa Elena", "Lorem ipsum dolor sit amet"],
			purisima: ["Purísima", "Es una localidad ubicada en el municipio de Arroyo Seco en el estado de Querétaro, rodeada por la Sierra Gorda queretana, sus dos principales actividades económicas son: la agricultura y la cría de ganado menor.\nSus pobladores se refieren con orgullo de sus migrantes, quienes a pesar de la distancia no se olvidan de su pueblo natal y través de diferentes programas han apoyado obras públicas como la cancha de fútbol, el lazo que une familias a través de las fronteras es muy fuerte en la comunidad de Purísima de Arista, es por eso que se distingue por el cariño hacia sus migrantes, familias enteras esperan con anhelo la llegada del mes de diciembre, y con él, la llegada de la caravana migrante."],
			lagunita: ["La Lagunita","El municipio de Landa de Matamoros es conocido por tener dos de las 5 misiones franciscanas, La misión de Landa y la misión de Tilaco, sin embargo; a solo 15 minutos de la primera se encuentra la localidad de La Lagunita.\nLa entrada a “La Lagunita” es inesperada,  la avenida principal se compone de un negocio tras otro, desde ciber cafés, papelerías, tiendas de ropa “americana” hasta una pequeña agencia de viaje con un letrero que dice “ Salidas todos los días a Estados Unidos”. En esa misma avenida se encuentra el “Monumento al dólar” una escultura de un migrante en retorno con su maleta y extendiendo los brazos para recibir a su familiar que corren hacía él con una placa de reconocimiento al aporte económico de los paisanos y al esfuerzo de todos sus migrantes.
"]}
    respond_to do |format|
      format.html
    end
  end

  protected

  def set_localidad
    locs = {ixtlilco: "Ixtlilco el grande", jantetelco: "Jantetelco", marcelinorodriguez: "Marcelino Rodiguez", sangabriel: "San Gabriel", tetela: "Tetela", peto: "Peto", santaelena: "Santa Elena", purisima: "Pusrísima", lagunita: "La Lagunita"}
    @loc = locs[current_user.usuario.to_sym]
  end

  def set_class
    h_class = {ixtlilco: "ixtlilco", jantetelco: "jantetelco", marcelinorodriguez: "marcelino", sangabriel: "san-gabriel", tetela: "tetela", peto: "peto", santaelena: "sta-elena", purisima: "purisima", lagunita: "Lagunita"}
    @class = h_class[current_user.usuario.to_sym]
  end

  def form_params
    params.require(:datos_user).permit(:nombre, :email, :telefono, :pref, :localidad, :comentarios)
  end
end
