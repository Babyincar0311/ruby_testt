Rails.application.routes.draw do
  resources :students do
    resources :student_scores, only: [:new, :create, :edit, :update, :destroy]
  end

  root "students#index"
end
