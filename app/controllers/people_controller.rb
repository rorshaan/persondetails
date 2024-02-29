class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]

  def index
    @people = Person.all
  end

  def show
    @details = @person.details
    respond_to do |format|
      format.html
      format.turbo_stream 
    end
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person, notice: "Person was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: "Person was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy
    redirect_to root_path, notice: "Person was successfully destroyed."
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:title, :name, :age)
  end
end
