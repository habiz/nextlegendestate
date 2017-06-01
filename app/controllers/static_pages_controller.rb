class StaticPagesController < ApplicationController
  def home
    @property = current_user.properties.build if logged_in?
  end

  def services
  end

  def gallery
  end

  def contact
  end

  def signup
  end
end
