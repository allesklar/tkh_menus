Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :menus do
      member do
        get :reorder
      end
      collection do
        post :sort
      end
    end
  end
end
