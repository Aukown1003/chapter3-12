Rails.application.routes.draw do
  get 'lists/new'
  # postは新規投稿
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  # lists/:id = lists/1やlists/3を
  get 'lists/:id' => 'lists/show'
  get 'lists/edit'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
