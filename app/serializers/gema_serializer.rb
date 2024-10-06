class GemaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :owner
end
