Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  get 'users/show'

  get 'users/index'

  get 'songs/index'

  get 'public/index'

  get 'public/login'

  get 'public/logut'
  get 'public/sign_up'

  match 'public/login', to: 'public#login', via: [:post]

  get    'login'   => 'public#new'
  post   'login'   => 'public#create'
  get 'logout'  => 'public#destroy'

  get    'signup'   => 'users#new'
  # post   'users#create'

  # resources :users do
  #   member do
  #     get :delete
  #   end
  # end

  scope '/songs' do
    get '/' => 'songs#list'
    post '/' => 'songs#create'
    scope '/:id' do
      get '/' => 'songs#show'
      put '/' => 'songs#update'
    end
  end


  scope '/albums' do
    get '/' => 'albums#list'
    post '/' => 'albums#create'
    scope '/:id' do
      get '/' => 'albums#show'
      put '/' => 'albums#update'
    end
  end

  scope '/artists' do
    get '/' => 'artists#list'
    post '/' => 'artists#create'
    scope '/:id' do
      get '/' => 'artists#show'
      put '/' => 'artists#update'
    end
  end

  root  'public#index'

  match ':controller(/:action(/:id(.:format)))', :via => [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
