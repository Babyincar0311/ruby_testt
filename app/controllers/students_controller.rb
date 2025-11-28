class StudentsController < ApplicationController
  # Lấy tất cả sinh viên để hiển thị danh sách
  def index
    @students = Student.all
  end

  # Khởi tạo đối tượng mới cho form thêm mới
  def new
    @student = Student.new
  end

  # Xử lý tạo mới sinh viên
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "Student added successfully"
    else
      render :new
    end
  end

  # HÀNH ĐỘNG SỬA (EDIT)
  def edit
    @student = Student.find(params[:id])
  end

  # HÀNH ĐỘNG CẬP NHẬT
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path, notice: "Student updated successfully"
    else
      render :edit
    end
  end

  # HÀNH ĐỘNG XÓA (DESTROY)
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path, notice: "Student deleted successfully"
  end
  # HÀNH ĐỘNG XEM CHI TIẾT (SHOW)
  def show
    @student = Student.find(params[:id])
  end

  private

  # Phương thức riêng tư để chỉ định các tham số được phép
  def student_params
    params.require(:student).permit(:student_code, :full_name, :address)
  end
end
