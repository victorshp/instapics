class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
  end

  def new
    if user_signed_in?
      @pic = current_user.pics.build
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to pic_path(@pic)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to pic_path(@pic)
    else
      render :edit
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  def upvote
    @pic.upvote_by current_user
    redirect_to :back
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :photo)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
