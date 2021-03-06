require "render_anywhere"

class Tabla
  include RenderAnywhere

  def initialize(datos)
    @filas = datos
  end

  def a_pdf
    pdf = PDFKit.new(html,page_size: 'Letter')
    pdf.to_file("#{Rails.root}/public/4arcH_d4T_x@.pdf")
  end

  def filename
    "data_usrs_#{DateTime.now}.pdf"
  end

  private

  def html
    render template: "admin/tabla", layout: "application", locals: { filas: @filas }
  end
end
