class PeopleController < ApplicationController
  layout 'QandA'
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
=begin
    if Person.where "account_id == ? and account_id != ?",params['account_id'],nil  then
      @msg = Person.where "account_id == ?",params['account_id']
      @msg2= Person.where "account_id != ?",nil
      current_account
=end
    if @people.find_by(account_id: current_account.id)!= nil then
      redirect_to '/questions/'
    else
      redirect_to '/people/new/'+ current_account.id.to_s
    end
  end

  # GET /people/1 or /people/1.json
  def show

  end

  # GET /people/new
  def new
    @person = Person.new
    @person.account_id = params[:account_id]
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:account_id,:name,:age, :address, :phoneN, :mail, :question_id, :answer_id)
    end
end
