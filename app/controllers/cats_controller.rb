class CatsController < ApplicationController
   def index
      cats = Cat.all
      render json: cats

   def show
      cat = Cat.find(params[:id])
      render json: cat
   end
   
      # Implement create, update, destroy actions here
end