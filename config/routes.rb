Rails.application.routes.draw do
   namespace :admin do
   #get 'items' => 'admins/items#index'
   get 'homes' => 'homes#top'
 end 
   get 'items' => 'customers/items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 namespace :admin do
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
 end   
 
 devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
 }
  
 devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
 }

end
