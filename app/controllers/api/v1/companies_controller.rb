class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all

    render json: @companies
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  # PUT /companies/1/mark_deleted
  def mark_deleted
    company = Company.find(params[:company_id])

    if company.deleted
      puts "deleted: "
      render json: { deleted_company: [],
                     deleted_already: :not_modified,
      }
    else
      company.delete_company # model method
      render json: { deleted_company: company,
                     code: 200,
                     status: :success,
      }, except: [:created_at, :updated_at]
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.permit(:name, :location)
  end
end
