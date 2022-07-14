class ReservesController < ApplicationController
  before_action :reserve_params, except: [:add, :index, :show]

  def index
    @inns=Inn.all
    @reserves = Reserve.all
  end

  def show
    @reserve = Reserve.find(params[:id])
  end

  def add
    @reserve = Reserve.new
  end

  def confirm
    @reserve=Reserve.new(@attr)
    if @reserve.invalid?
      redirect_to "/inns/#{@reserve.inn_id}"
    end
  end

  def complete
    Reserve.create!(@attr)
    @reserve = Reserve.order(updated_at: :desc).limit(1)
    id_array=@reserve.ids
    redirect_to "/reserves/#{id_array[0]}"
  end

  def back
		@reserve = Reserve.new(@attr)
		redirect_to "/inns/#{@reserve.inn_id}"
	end

  private
  def reserve_params
    @attr = params.require("reserve").permit(:id, :inn_id, :start_date, :end_date, :guest_num,:price_sum)
  end

end
  