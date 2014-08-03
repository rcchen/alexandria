Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'home' => 'users#index'
  get 'login' => 'users#login'
  get 'logout' => 'users#logout'

  get 'books' => 'books#index'
  get 'books/search' => 'books#search'
  get 'books/:id' => 'books#view'
  get 'books/:id/update' => 'books#update'

  get 'groups' => 'reading_groups#index'
  get 'groups/:id' => 'reading_groups#view'

  get 'discussions/new' => 'discussions#new'
  post 'discussions/create' => 'discussions#create'

  get 'recommendations/new' => 'recommendations#new'
  post 'recommendations/create' => 'recommendations#create'
  get 'recommendations/edit' => 'recommendations#edit'
  post 'recommendations/modify' => 'recommendations#modify'

  # You can have the root of your site routed with "root"
  root 'users#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

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
