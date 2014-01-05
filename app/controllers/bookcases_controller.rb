class BookcasesController < ApplicationController
  before_action :set_bookcase, only: [:show, :edit, :update, :destroy]

  def new
    @bookcase = Bookcase.new
  end

  def create
    @bookcase = Bookcase.new(bookcase_params)
  end

  def show
  end

  def destroy
  end

  private
  def set_bookcase
    @bookcase = Bookcase.find(params[:id])
  end

  def bookcase_params
    params.require(:bookcase).permit(:name, :user_id)
  end
end
