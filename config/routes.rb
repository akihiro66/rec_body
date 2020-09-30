Rails.application.routes.draw do
  root "graphs#index"

  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  resource :graphs, only: %i[index create update]
end
