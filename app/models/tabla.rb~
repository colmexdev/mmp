require "render_anywhere"

class Tabla
  include RenderAnywhere

  def initialize(datos)
    @filas = datos
  end

  def a_pdf
    pdf = PDFKit.new(html,page_size: 'Letter')
    pdf.to_file("#{Rails.root}/public/data.pdf")
  end

  def filename
    "data_usrs_#{DateTime.now}.pdf"
  end

  private
  #attr_reader :invoice

  def html
    render template: "admin/tabla", layout: "application", locals: { filas: @filas }
  end
end
