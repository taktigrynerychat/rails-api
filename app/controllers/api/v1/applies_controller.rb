class Api::V1::AppliesController < ApplicationController
  before_action :set_apply, only: [:show, :update, :destroy]

  # GET /applies
  def index
    @applies = Apply.all

    render json: @applies
  end

  # GET /applies/1
  def show
    render json: @apply
  end

  # POST /applies
  def create
    @apply = Apply.new(apply_params)

    if @apply.save
      render json: @apply, status: :created
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applies/1
  def update
    if @apply.update(apply_params)
      render json: @apply
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applies/1
  def destroy
    @apply.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_apply
    @apply = Apply.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def apply_params
    params.permit(:job_id, :geek_id, :read, :invited)
  end
end
