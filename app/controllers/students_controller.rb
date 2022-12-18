class StudentsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  def index
    render json: Student.all, status: :ok
  end

  def show
    student = Student.find(params[:id])
    render json: student, status: :ok
  end

  def create 
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    render json: student, status: :ok
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    render json: {message: "Destroyed"}, status: :ok
  end


private

    def not_found
        render json: {error: "Student not found"}, status: :not_found
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def invalid_entry (invalid)
    render json: {errors: ErrorMessageSerializer.errors(invalid.record.errors) }, status: :unprocessable_entity

    end

end

