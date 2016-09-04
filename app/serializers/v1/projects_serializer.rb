module V1
  class ProjectsSerializer < ActiveModel::Serializer

    attributes :title, :link, :leaked, :id
    # has_one :user, serializer: V1::UserSerializer

  end
end
