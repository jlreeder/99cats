class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    if @cat
      # NOTE: When do we use `cat_url(@cat)`?
      render :show
    else
      flash.now[:errors] = @cat.errors.full_messages
      redirect_to :index
    end
  end

  def new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      render :show
    else
      flash.now[:errors] = @cat.errors.full_messages
      redirect_to :new
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
