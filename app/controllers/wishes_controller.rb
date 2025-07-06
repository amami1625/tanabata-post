class WishesController < ApplicationController
  before_action :set_wishes

  def index
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      redirect_to root_path, success: "あなたの願いが叶いますように"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:name, :message)
  end

  def set_wishes
    @wishes = Wish.order(created_at: :desc)
  end
end
