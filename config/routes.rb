Rails.application.routes.draw do
  resources :horizon_bank_transactions
  resources :horizon_cash_transactions
  resources :branch_cash_transactions
  get "/reset_demo" => "branch_cash_transactions#reset_demo"
  get "/cancel_transaction" => "branch_cash_transactions#cancel_transaction"
  get "/confirm_transaction" => "branch_cash_transactions#confirm_transaction"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
