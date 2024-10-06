class Api::V1::GemasController < ApplicationController
  before_action :set_gem, only: [ :show ]


  def index
    @gemas = Gema.all
    render json: @gemas
  end

  def show
    render json: @gema
  end

  def create
    @gema = Gema.new gema_params

    if @gema.save
      render json: @gema, status: :created
    else
      render json: @gema.errors, status: :unprocessable_entity
    end
  end

  private

  def gema_params
    params.require(:gema).permit :name, :description, :owner_id
  end

  def set_gem
    @gema = Gema.find_by id: params[:id]
    render json: { error: "Gem not found" }, status: :not_found unless @gema
  end
end
