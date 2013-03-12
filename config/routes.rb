Final::Application.routes.draw do

  resources :tests


  #get 'reviews/:review_id/delete' => 'reviews#destroy_from_review_page', :as=>'delete_review_from_review_page'
  get 'recipes/:id/review/:review_id/delete'=>'reviews#destroy',:as=> 'destroy_review'
  get "dashboard/index", :as=>:dashboard
  # get "recipes/review"
  get "home/index"

  get 'reviews' => 'reviews#index', :as=> 'reviews'
  # post 'reviews'=> 'reviews#create'
  post 'recipes/:id/newreview'=> 'reviews#create'
  #get 'reviews/new/:id'=> 'reviews#new', :as => 'new_review'
  get 'recipes/:id/newreview'=> 'reviews#new', :as => 'new_review'
  get 'recipes/:id/review/:review_id/edit/' =>'reviews#edit', :as=>'edit_review'
  # get 'reviews/:id/edit'=>'reviews#edit', :as=> 'edit_review'
  get 'recipes/:id/review/:review_id' =>'reviews#show', :as=> 'review'
  put 'recipes/:id/review/:review_id/edit/' =>'reviews#update'
  #delete 'recipes/:id/review/:review_id' => 'reviews#destroy', :as=>'delete_review'

  #get 'reviews/:review_id/delete' => 'reviews#destroy_from_review_page', :as=>'delete_review_from_review_page'
  #get 'r/delete' => 'reviews#destroy_from_review_page', :as=>'delete_review_from_review_page'
  #delete 'recipes/:id/review/:review_id/delete' => 'reviews#destroy', :as=>'delete_review'
  # resources :reviews

  get 'recipes/test'=> 'recipes#test', :as=>'recipes_test'
  # get 'reviews/new/:id'=>"reviews#new", :as => 'new_new_review'

  get "recipes/search" =>'recipes#lookingforrecipes', :as => 'search'
 
  resources :recipes
  get 'blah', :controller=>'reviews', :action=>'create2'
  devise_for :users


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
