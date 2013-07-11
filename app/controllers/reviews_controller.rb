class ReviewsController < ApplicationController
	before_filter :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
	  @review = Review.new(
			     :comment    => params[:review][:comment],
			     :product_id => @product.id,
			     :user_id    => current_user.id
			  )
		if @review.save
			redirect_to products_path, notice: 'Thanks for submitting a review!'
		else
			render :action => :show
		end
  end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
	end

  def edit
  end


	private

	def load_product
		@product = Product.find(params[:product_id])

	end
end
