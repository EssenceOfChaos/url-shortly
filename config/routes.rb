Rails.application.routes.draw do

    get "/:shortened", to: "urls#show"
    resources :urls, only: :create

    # resources :urls, only: :create

end
