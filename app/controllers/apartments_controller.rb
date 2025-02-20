class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def index
        render json: Apartment.all, status: :ok
    end
    def show
        apartment = find_apartment
        render json: apartment, include: :leases
    end
    def create
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created
    end
    def update
        apartment = find_apartment
        apartment.update(apartment_params)
        render json: apartment
    end
    def destroy
        apartment = find_apartment
        apartment.destroy
        head :no_content
    end

    private
    def find_apartment
        Apartment.find(params[:id])
    end
    def apartment_params
        params.permit(:number)
    end
    def render_not_found
        render json: {error: "Apartment not found"}, status: :not_found
    end
    def render_invalid(invalid)
        render json: {"errors": invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
