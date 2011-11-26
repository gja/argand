Argand::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "pages#root"
  get ':page_name' => "pages#show"
  post ':page_name' => "pages#update"
end
