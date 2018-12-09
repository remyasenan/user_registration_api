Rails.application.routes.draw do

  devise_scope :user do
    post "users/registations" => "users/registrations#create"
  end

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :users do
    collection do
      resource :registrations
     end
  end

end
