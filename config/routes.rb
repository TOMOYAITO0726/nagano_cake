Rails.application.routes.draw do
   
   root to: 'public/homes#top'
   get 'about' => 'public/homes#about'
   #get '/public/customers/:id'=>'/public/customers/show', as :'/customers/my_page'
   
   namespace :admin do
   #get 'items' => 'admins/items#index'
   #get 'homes' => 'homes#top'
   end 
   
   namespace :public do
   get 'homes' => 'homes#top' 
   #resource:customers,only:[:show, :edit, :update]
   get '/customers/my_page' => 'customers#show'
   
   patch '/customers/out'=>'customers#out'
   get '/customers/edit'=>'customers#edit'
   patch 'customers/update'=>'customers#update'
   get '/customers/quit'=>'customers#quit'
   resources :addresses, only: [:index, :create, :new, :edit, :update, :destory]
   end
   #get 'items' => 'customers/items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 namespace :admin do
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
 end   
 
 devise_for :admin, skip:[:registrations, :passwords],controllers: {
    sessions: 'admin/sessions',
    #passwords: 'admin/passwords',
    #registrations: 'admin/registrations'
 }
  
 devise_for :customers,skip:[:passwords], controllers: {
    sessions: 'public/sessions',
    #passwords: 'public/passwords',
    registrations: 'public/registrations'
 }

end
