class InstructorsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry
# rescue_from ActiveRecord::UnknownAttributeError, with: :invalid_entry



  def index
    render json: Instructor.all, status: :ok
  end

  def show
    instructor = Instructor.find(params[:id])
    render json: instructor, status: :ok
  end

  def create 
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = Instructor.find(params[:id])
    instructor.update(instructor_params)
    render json: instructor, status: :ok
  end

  def destroy
    instructor = Instructor.find(params[:id])
    instructor.destroy
    render json: {message: "Destroyed"}, status: :ok
  end


private

    def not_found
        render json: {error: "Instructor not found"}, status: :not_found
    end

    def instructor_params
        params.permit(:name)
    end

    def invalid_entry (invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

end
