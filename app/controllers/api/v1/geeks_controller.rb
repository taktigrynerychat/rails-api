class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update, :destroy]

  # GET /geeks
  def index
    if params[:geek_id]
      @geeks = Geek.find(params[:geek_id]).geeks
    else
      @geeks = Geek.all
    end
    render json: { geeks: @geeks }, except: [:id, :created_at, :updated_at]
  end

  # GET /geeks/1
  def show
    render json: @geek
  end

  # POST /geeks
  def create
    @geek = Geek.new(geek_params)

    if @geek.save
      render json: @geek.as_json, status: :created
    else
      render json: {user: @geek.errors, status: :no_content}
    end
  end

  # PATCH/PUT /geeks/1
  def update
    if @geek.update(geek_params)
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end

  # DELETE /geeks/1
  def destroy
    @geek.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_geek
    @geek = Geek.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def geek_params
    params.permit(:name, :stack, :resume)
  end
end
