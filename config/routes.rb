ChelitasArtesanasApi::Application.routes.draw do
  resources :vendors, only: [:index]
end
