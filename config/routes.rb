InquisitorApp::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions
  resources :answers, only: [:create, :destroy, :show]
    
  root to: 'static_pages#home'
  
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/addquestion', to: 'questions#new'
  match '/answer_questions', to: 'users#answer_questions'
  match '/all_answers', to: 'questions#all_answers'
end
