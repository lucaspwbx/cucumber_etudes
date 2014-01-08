class SessionsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    redirect_to root_url
  end
end
