class RateController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", 
	only: :destroy

	def create
    	@cat = Cats.find(params[:cat_id])
    	@rate = @cat.rate.create(rate_params)
    	redirect_to cat_path(@cat)
  	end

  	def destroy
    	@cat = Cats.find(params[:cat_id])
    	@cat = @cat.rates.find(params[:id])
    	@rate.destroy
    	redirect_to cat_path(@cat)
	end
 
  public
    def rate_params
      params.require(:rate).permit(:body)
    end
end
