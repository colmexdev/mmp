class CreateDatosUsers < ActiveRecord::Migration
  def change
    create_table :datos_users do |t|
      t.text :nombre, null: false
      t.text :email
      t.text :telefono
      t.text :pref, null: false
      t.text :localidad, null: false

      t.timestamps null: false
    end
  end
end
