AdaReads::Application.routes.draw do
  # get "bookcases/new"
  # get "bookcases/show"
  # get "books/new"
  # get "books/show"
  # get "books/index"
  # get "books/destroy"
  # get "users/new"
  # get "users/update"
  # get "users/destroy"
  # get "users/create"
  # get "users/show"
  # get "users/index"
  root 'books#index'
  get "log_out"       => "sessions#destroy", :as => "log_out"
  get "log_in"        => "sessions#new",     :as => "log_in"
  get "sign_up"       => "users#new",        :as => "sign_up"
  resources :users do
    collection do
      get 'search'
    end
  end
  resources :sessions
  resources :friendships, only: [:create, :destroy]
  resources :books do
    collection do
      get 'search'
    end
  end
  resources :bookcases, only: [:show]
  resources :bookcase_books
  delete "bookcase_book/:bookcase_id/:book_id" => "bookcase_books#destroy", :as => "delete_bookcase_book"
  patch "bookcase_book/:bookcase_id/:book_id" => "bookcase_books#update", :as => "move_bookcase_book"

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
