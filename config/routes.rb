Rails.application.routes.draw do
    root to: "urls#index"
    get "/:shortened", to: "urls#show"
    resources :urls, only: [:index, :create]

end
