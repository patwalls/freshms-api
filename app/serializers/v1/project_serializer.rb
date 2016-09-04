module V1
  class ProjectSerializer < ActiveModel::Serializer

    attributes :title, :link, :leaked, :id
    # has_one :user, serializer: V1::UserSerializer

  end
end
