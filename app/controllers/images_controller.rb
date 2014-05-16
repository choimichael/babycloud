class ImagesController < ApplicationController
  def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(params.require(:image).permit(:post_image))
  	if @image.save
  		redirect_to :action => :show, :id => @image.id
  	end
  end

  def show
  	@id = params[:id]
  	@image = Image.find(@id)
  end
end
