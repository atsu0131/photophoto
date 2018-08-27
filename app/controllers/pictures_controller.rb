class PicturesController < ApplicationController
   before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      ContactMailer.contact_mail(@picture).deliver
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path
  end

  def confirm
    @picture = Picture.new(pictures_params)
  end

  private
  def pictures_params
    params.require(:picture).permit(:title,:content,:image,:image_cache)
  end

  def set_blog
    @picture = Picture.find(params[:id])
  end

end
