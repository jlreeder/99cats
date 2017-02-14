class CatsControllerController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    if @cat
      render cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      redirect_to :index
    end
  end
end
