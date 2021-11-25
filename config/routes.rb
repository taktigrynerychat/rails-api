Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :jobs

      resources :companies do
        match 'mark_deleted', to: 'companies/mark_deleted', via: :put
        resources :jobs
      end

      resources :applies

      resources :geeks do
        resources :applies
      end

      match "*path", to: "application#catch_404", via: :all
    end
  end
end
