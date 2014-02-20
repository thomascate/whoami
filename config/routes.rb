Whoami::Application.routes.draw do

  namespace :api , :defaults => {:format => :json} do
    resources :IP
    root :to => 'ip#index'

  end

  get "welcome/index"

  root :to => 'welcome#index'

end
