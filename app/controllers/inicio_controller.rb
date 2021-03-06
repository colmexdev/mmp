class InicioController < ApplicationController
  before_action :authenticate_user!, only: [:inicio_usr,:formulario,:crear_formulario,:respuesta]
  before_action :set_localidad, only: [:formulario,:crear_formulario,:respuesta]
  before_action :set_class, only: [:inicio_usr,:formulario,:crear_formulario,:respuesta]

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
			peto: ["Peto","Es uno de los 106 municipios del estado de Yucatán, su significado en maya es “Corona de la Luna”. La plaza del pueblo está rodeada de comercios de todo tipo, con una notoria tendencia a las cantinas, las cuales están abiertas desde muy temprano, en especial los viernes ya que es el día en que los hombres comienzan a tomar desde temprano. Enfrente de la plaza, se encuentra la iglesia de Nuestra Señora de la Asunción, los fines de semana por la mañana es normal ver a las personas vendiendo los productos que ellos mismos cultivaron, en especial: pepino y calabaza.\nPeto es un municipio muy importante, este es un punto de contacto comercial, mercancías provenientes, principalmente, de Oxkutzcab y Felipe Carrillo Puerto en Quintana Roo pasan por Peto en su camino a Mérida. Sus pobladores recuerdan con nostalgia al “Peto chiclero”, una época de mucho auge económico y que llevó el ferrocarril a una de las comunidades más lejanas de la capital, el chicle era elaborado con la resina del chicozapote y era exportado a otros lugares."],
			santaelena: ["Santa Elena", "El municipio de Santa Elena, es un lugar de tradiciones vivas. Su gente es alegre y cálida, entre ellos es común hablar en maya y trasladarse de un lugar a otro en mototaxi así como en colectivos que salen de la plaza  ( la cual fue remodelada con 3 x1) cada 15 - 20 min.  A un costado de ésta, a lo alto se encuentra la iglesia de Santa Elena cuyas escaleras son los restos de lo que solía ser una pirámide, desde la azotea de esta se puede ver la pirámide de Uxmal.\nPor las mañanas en la plaza, las personas esperan por el transporte a su trabajo, el cual generalmente es en uno de los hoteles cercanos o sitios arqueológicos. Santa Elena está rodeado de sitios turísticos, a solo 10 minutos de distancia de Uxmal y rodeado por los sitios arqueológicos de Uxmal, Kabah, Sayil, X-Lapak, Labná, Oxkintok, Grutas de Calcehtok y las Grutas de Loltún, que en su conjunto son conocidos como “ La ruta puuc”.\nA pesar de esto, es un pueblo muy tranquilo, se puede decir que es la coyuntura entre miles de años de tradiciones y la vida contemporánea. El nombre maya de Santa Elena es: Nohcacab, significa \"el gran lugar de la buena tierra\"."],
			purisima: ["Purísima", "Es una localidad ubicada en el municipio de Arroyo Seco en el estado de Querétaro, rodeada por la Sierra Gorda queretana, sus dos principales actividades económicas son: la agricultura y la cría de ganado menor.\nSus pobladores se refieren con orgullo de sus migrantes, quienes a pesar de la distancia no se olvidan de su pueblo natal y través de diferentes programas han apoyado obras públicas como la cancha de fútbol, el lazo que une familias a través de las fronteras es muy fuerte en la comunidad de Purísima de Arista, es por eso que se distingue por el cariño hacia sus migrantes, familias enteras esperan con anhelo la llegada del mes de diciembre, y con él, la llegada de la caravana migrante."],
			lagunita: ["La Lagunita","El municipio de Landa de Matamoros es conocido por tener dos de las 5 misiones franciscanas, La misión de Landa y la misión de Tilaco, sin embargo; a solo 15 minutos de la primera se encuentra la localidad de La Lagunita.\nLa entrada a “La Lagunita” es inesperada,  la avenida principal se compone de un negocio tras otro, desde ciber cafés, papelerías, tiendas de ropa “americana” hasta una pequeña agencia de viaje con un letrero que dice “ Salidas todos los días a Estados Unidos”. En esa misma avenida se encuentra el “Monumento al dólar” una escultura de un migrante en retorno con su maleta y extendiendo los brazos para recibir a su familiar que corren hacía él con una placa de reconocimiento al aporte económico de los paisanos y al esfuerzo de todos sus migrantes.
"]}
    respond_to do |format|
      format.html
    end
  end

  protected

  def set_localidad
    locs = {ixtlilco: "Ixtlilco el grande", jantetelco: "Jantetelco", marcelinorodriguez: "Marcelino Rodiguez", sangabriel: "San Gabriel", tetela: "Tetela", peto: "Peto", santaelena: "Santa Elena", purisima: "Purísima", lagunita: "La Lagunita"}
    @loc = locs[current_user.usuario.to_sym]
  end

  def set_class
    h_class = {ixtlilco: "ixtlilco", jantetelco: "jantetelco", marcelinorodriguez: "marcelino", sangabriel: "san-gabriel", tetela: "tetela", peto: "peto", santaelena: "sta-elena", purisima: "purisima", lagunita: "lagunita"}
    @class = h_class[current_user.usuario.to_sym]
  end

  def form_params
    params.require(:datos_user).permit(:nombre, :email, :telefono, :pref, :localidad, :comentarios)
  end
end
