class DeviceSerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :created_at
end