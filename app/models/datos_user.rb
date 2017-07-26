class DatosUser < ActiveRecord::Base
  validates_presence_of :nombre
  validates_presence_of :pref
  validates_presence_of :localidad
  validates_format_of :email, with: Devise::email_regexp
  validates :telefono, presence: true, if: "email.blank?"
end
