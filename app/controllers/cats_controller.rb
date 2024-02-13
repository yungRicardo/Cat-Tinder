class CatsController < ApplicationController
   def index
      cats = Cat.all
      render json: cats
   end

   def show
      cat = Cat.find(params[:id])
      render json: cat
   end


   def create
      cat = Cat.create(cat_params)
      if cat.save
         render json: cat, status: :created
      else
         render json: cat.errors, status: :unprocessable_entity
      end
   end
   
   def update
      cat = Cat.find(params[:id])
      if cat.update(cat_params)
         render json: cat
      else
         render json: cat.errors, status: :unprocessable_entity
      end
   end
   
   def destroy
      cat = Cat.find(params[:id])
      cat.destroy
      head :no_content
   end

   private
   
   def cat_params
      params.require(:cat).permit(:name, :age, :enjoys, :image)
   end
   
end