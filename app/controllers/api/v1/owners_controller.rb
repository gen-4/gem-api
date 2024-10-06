class Api::V1::OwnersController < ApplicationController
  before_action :set_owner, only: [ :show ]


  def index
    @owners = Owner.all
    render json: @owners
  end

  def show
    render json: @owner
  end

  def create
    @owner = Owner.new owner_params

    if @owner.save
      render json: @owner, status: :created
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  private

  def owner_params
    params.require(:owner).permit :name
  end

  def set_owner
    @owner = Owner.find_by id: params[:id]
    render json: { error: "Owner not found" }, status: :not_found unless @owner
  end
end
