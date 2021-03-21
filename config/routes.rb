Rails.application.routes.draw do
  resources :parkings
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  get "terms_and_conditions", to: "static_pages#terms_and_conditions"
  get "contact_us", to: "static_pages#contact_us"
  get "privacy_policy", to: "static_pages#privacy_policy"
  get "about_us", to: "static_pages#about_us"
  get "add_choices", to: "parkings#choose"
  get "parking_availability", to: "parkings#parking"
  post "find_parking", to: "parkings#find_parking"
  # get "choose", to: "parkings"

end
