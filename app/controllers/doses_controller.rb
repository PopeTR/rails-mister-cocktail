class DosesController < ApplicationController
  def index
  end

  def new
    @dose = Dose.new
  end

  def show
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def destroy
    @dose.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
