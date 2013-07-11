class UsersController < ApplicationController
  def new
		@user = User.new

  end

  def create
		@user = User.new(params[:user])
		respond_to do |format|
			if @user.save
		    format.html { flash[:notice] = 'Welcome Aboard!'
        redirect_to products_url
				}
			else
				format.html { render 'new' }
			end
    end
  end
end

