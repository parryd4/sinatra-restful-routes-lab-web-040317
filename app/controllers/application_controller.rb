require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do

    @recipes = Recipe.all
    erb :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to("/recipes/#{@recipe.id}")
    #erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy 

    redirect to('/recipes')
  end

  patch '/recipes/:id' do

    @recipe = Recipe.find(params[:id])
    @recipe.name =params[:name]
    @recipe.name =params[:ingredients]
    @recipe.name =params[:cook_time]
    @recipe.update

    redirect to("/recipes/#{@recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
end
