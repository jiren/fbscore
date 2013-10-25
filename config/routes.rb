FbScore::Application.routes.draw do
  resources :businesses, :only => [:index, :new, :create]

  root :to => "businesses#index"
end
