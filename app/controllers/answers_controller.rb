class AnswersController < ApplicationController
  layout 'QandA'
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    #@answers = Answer.all
    redirect_to '/questions'
  end

  # GET /answers/1 or /answers/1.json
  def show
    redirect_to '/questions'
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    redirect_to '/questions'
  end

  # POST /answers or /answers.json
  def create
    end_counter=10
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        num = Answer.where('question_id=?',@answer.question_id).count
        if num >= end_counter then
          q =Question.find @answer.question_id
          q.finished = true
          q.save
        end
        #format.html { redirect_to answer_url(@answer), notice: "Answer was successfully created." }
        format.html { redirect_to '/questions/'+@answer.question_id.to_s }
        format.json { render :show, status: :created, location: @answer }
      else
        #format.html { render :new, status: :unprocessable_entity }
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
=begin
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
=end
    render '/questions'
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
=begin
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
=end
    render '/questions'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:question_id, :content, :name)
    end
end
