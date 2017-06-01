class PropertiesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      flash[:success] = 'Property Created!'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

private
  def property_params
    params.require(:property).permit(:content)
  end
end
