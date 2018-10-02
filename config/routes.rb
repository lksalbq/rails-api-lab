Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  #resources :auths, only: [:create]
  resources :kinds

  constraints subdomain: 'api' do
    api_version(:module => "V1", :path => {:value => "v1"}) do
      resources :contacts do
      	resource :kind, only: [:show]
      	resource :kind, only: [:show], path: 'relationships/kind'
      
      	resource :phones, only: [:show]
      	resource :phones, only: [:show], path: 'relationships/phones'
      	
      	#create, update,destoy
      	resource :phone, only: [:create, :update, :destroy]
      	resource :phone, only: [:create, :update, :destroy], path: 'relationships/phones'
      	

      	resource :address, only: [:show,:update,:create, :destroy]
      	resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
      end
    end


  
    api_version(:module => "V2", :path => {:value => "v2"}) do
      resources :contacts do
        resource :kind, only: [:show]
        resource :kind, only: [:show], path: 'relationships/kind'
      
        resource :phones, only: [:show]
        resource :phones, only: [:show], path: 'relationships/phones'
        
        #create, update,destoy
        resource :phone, only: [:create, :update, :destroy]
        resource :phone, only: [:create, :update, :destroy], path: 'relationships/phones'

        resource :address, only: [:show,:update,:create, :destroy]
        resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
