BonusCodeChecker::Application.routes.draw do
  resources :bonus_codes, only: [:validate] do
    get :validate, on: :collection
  end
end
