# routes is about user action
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shops do
    # so that we have nested URLs, use shallow nesting for certain things
    resources :products
  end

  resource :cart, only [:show] do
    post '/:product_id', to: 'cart#add_item_to_cart'
    delete '/:product_id', to: 'cart#remove_item_from_cart'
  end
  # method run before_action will create for us
end
