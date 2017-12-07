class AddComentarioToDatosUser < ActiveRecord::Migration
  def change
    add_column :datos_users, :comentarios, :text
  end
end
