class WelcomeController < ApplicationController
  def index
  end

  def devices_api
  	@devices = User.find(4).devices
  	@devices.each do |device|
  		device.name = "Name: " + device.name
  		device.uniq_code = "Current Value: " + device.datums.last.value
  	end

  	render json: {devices: @devices}
  end
end
