class V1::ProjectsController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def index
    @projects = Project.all
    render json: @projects, each_serializer: V1::ProjectsSerializer
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, serializer: V1::ProjectSerializer
    else
      render json: { error: t('project_create_error') }, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :link, :leaked)
    # params.require(:project).permit(:title, :link, :leaked).merge(user: current_user)
  end
end
