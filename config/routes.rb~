Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}, :path => '', :path_names => {:sign_in => 'inicio', :sign_up => 'r3_s3rI0'}
  devise_for :admins, :controllers => {:registrations => "registrations"}, :path => 'admins', :path_names => {:sign_in => 'acceder', :sign_up => 'r4_4Im'}

  get 'terminos_y_condiciones' => 'inicio#inicio_usr', :as => :inicio_usr
  get 'formulario' => 'inicio#formulario', :as => :formulario
  post 'formulario' => 'inicio#crear_formulario', :as => :save_form
  get 'respuesta' => 'inicio#respuesta', :as => :respuesta

  get 'algo' => 'inicio#inicio', :as => :prueba

  get 'datos' => 'admin#datos', :as => :admin_datos

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
