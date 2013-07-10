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


#
#respond_to do |format|
#	if @photo.save
#		format.html { redirect_to photos_path , notice: 'Photo was successfully created.' }
#		format.json { render action: 'show', status: :created, location: @photo }
#	else
#		format.html { render action: 'new', flash[:alert] => 'Missing fields'}
#		format.json { render json: @photo.errors, status: :unprocessable_entity }
#	end
#end
#end