class DetailsController < ApplicationController
  before_action :set_person_and_detail, only: %i[show new create edit update destroy]

  def new
    @detail = @person.details.new
  end

  def edit
  end

  def create
    @detail = @person.details.new(detail_params)

    if @detail.save
      redirect_to @person
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @detail.update(detail_params)
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @detail.destroy
    redirect_to @person, notice: "Detail was successfully destroyed."
  end

  private

  def set_person_and_detail
    @person = Person.find_by(id: params[:person_id])
    @detail = Detail.find(params[:id]) if params[:id].present?
  end

  def detail_params
    params.require(:detail).permit(:email, :phone)
  end
end
