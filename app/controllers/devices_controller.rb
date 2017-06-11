class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_my_device, only: [:edit, :update, :show, :destroy]

def index
  @devices = current_user.devices.includes(:datums)
  @datum_count = 0
  @devices.each do |device|
    @datum_count = device.datums.count + @datum_count
  end
end

def show
  if @device.address != "test"
    @garbage_level = CoAP::Client.new.get_by_uri("coap://#{@device.address}/sensors/ambient_light").payload
  end
end

def new
  @device = Device.new
end

def edit
end

def create
  @device = Device.new(params.require(:device).permit(:name,:address,:uniq_code))
  @device.user_id = current_user.id
  device_mac = CoAP::Client.new.get_by_uri("coap://#{@device.address}/sensors/mac").payload

  if device_mac == @device.uniq_code && MacList.find_by(mac_address: @device.uniq_code)
    @device.company_id = MacList.find_by(mac_address: @device.uniq_code).company.id
    if @device.save
      redirect_to @device
    else
      render 'new'
      flash[:danger] = "Some error happened, duh."
    end
  else
    flash[:danger] = "Device MAC not found, please register our products only."
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
