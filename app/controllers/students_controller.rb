class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #       render pdf: "Student No. #{@student.id}",
    #       page_size: 'A4',
    #       template: "students/pdf.html.erb",
    #       layout: "pdf.html",
    #       orientation: "Landscape",
    #       lowquality: true,
    #       zoom: 1,
    #       dpi: 75
    #   end
    # end
    # file_name = "students-#{@student.id}.pdf"
    html = render_to_string( template: 'students/show.html.erb', orientation: "Landscape")
    kit = PDFKit.new(html, :page_size => 'Letter')
    # pdf = kit.to_file("")
    # file = kit.to_file('/path/to/save/pdf')
    # kit = PDFKit.new(html)
    # kit.to_file("/students/show.html.erb")
    # debugger
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:title, :body, :image_data)
    end
end
