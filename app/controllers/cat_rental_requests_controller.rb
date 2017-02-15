class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      render text: "You successfully submitted a rental request."
    else
      redirect_to new_cat_rental_request_url
    end
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
