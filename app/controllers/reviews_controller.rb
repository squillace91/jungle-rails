class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user

    @product = Product.find(@review.product_id)

    if @review.save
      redirect_to @product, notice: 'Review created!'
    else
      redirect_to @product, notice: 'Review not created! Error!'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    @product = Product.find(@review.product_id)

    redirect_to @product
  end

  private
    def review_params
      params.require(:review).permit(
        :product_id,
        :description,
        :rating
      )
    end

end
