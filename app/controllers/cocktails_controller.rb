class CocktailsController < ApplicationController
  def new
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
