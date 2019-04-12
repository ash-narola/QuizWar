Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  # resources :users
  
  namespace 'questionnaires' do
    get 'dashboard'
    get 'set_test'
    post 'create_test'
  end
  
  post 'users/:user_id/questionnaires/:id/prepare_test', to: 'questionnaires#prepare_test', as: 'users_questionnaire_prepare'
  post 'users/:user_id/questionnaires/:id/submit_test', to: 'questionnaires#submit_test', as: 'users_questionnaire_submit'
    
  root to: 'visitors#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
