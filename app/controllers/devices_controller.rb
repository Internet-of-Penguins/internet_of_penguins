class DeviceController < ApplicationController
  before_action :find_my_device, only: [:edit, :update, :show, :destroy]


def index
  @devices = Device.all
end

def show
end

def new
  @Device = Device.new
end

def edit
end

def create
  @device = Device.new(params.require(:device).permit(:name,:addres))
  @device.user_id = current_user.id
    if @device.save
      redirect_to @device
    else
      render 'new'
    end
end

def update
  if @device.update(device_params)
      redirect_to @device
    else
      render 'edit'
    end
end

def destroy
  @device.destroy
  redirect_to devices_path
end


private
  def device_params
    params.require(:device).permit(:name, :address)
  end

  def find_my_device
    @device = Device.find_by(id: params[:id])
  end


end