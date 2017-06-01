class CheckGarbageJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    user = User.find(3) #For demo
	user.devices.each do |device|
	  garbage_value = CoAP::Client.new.get_by_uri("coap://#{device.address}/sensors/ambient_light").payload
	  device.datums.create(name: 'garbage', value: garbage_value)
	end
	puts "Working"
  end
end
