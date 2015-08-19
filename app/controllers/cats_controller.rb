class CatsController < ApplicationController
	 http_basic_authenticate_with name: "dhh", password: "secret", 
	 except: [:index, :show]
 


	def new
		@cat=Cats.new
    end

	def edit
 		 @cat = Cats.find(params[:id])
	end

	def create
 	 @cat= Cats.new(cat_params)
 
 	 	if @cat.save
 	 		redirect_to @cat
 	 	else
 	 		render 'new'
		end
	end

	def update
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
	end

	def destroy
   		@cat = Cats.find(params[:id])
    	@cat.destroy
 
   		redirect_to cats_path
	end

	public
	def cat_params
		params.require(:cat).permit(:category, :title)
	end

	def show
		@cats = Cats.find(params[:id])
	end

	def index
		@cats = Cats.all 
	end

end
