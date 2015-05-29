class SquawksController < ApplicationController

  def create
    squawk = Squawk.create( squawk_params )
    squawk.user = current_user
    squawk.save!
    redirect_to "/profile"
  end

  def destroy
    Squawk.destroy(params[:id])
    redirect_to "/profile"
  end

  private

  def squawk_params
    params.require(:squawk).permit(:message)
  end

end
