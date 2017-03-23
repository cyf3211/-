class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到扬帆影评！"
  end
end
