class InnsController < ApplicationController

  layout "application"

  def index
  end

  def show
    @inn = Inn.find(params[:id])
    @reserve = Reserve.new
    @reserve.inn_id=@inn.id
  end

  def registrated
    @inns=Inn.where(user_id: current_user.id)
  end

  def search
  
  end

  def add
    @inn = Inn.new
  end

  def create
    @inn = Inn.new  inn_param
    @inn.user_id=current_user.id
    if @inn.save then
      redirect_to '/inns'
    end
  end

  def edit
  end
  def delete
    deleteItem = Inn.find(params[:id])
    deleteItem.destroy
    redirect_to "/inns"
  end
  private
  def inn_param
    params.require(:inn).permit(:innName, :innArea, :innPrice, :innResister, :innMemo, :innImage,:user_id)
  end

end

