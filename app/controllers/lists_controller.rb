class ListsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    # パラメーター(リストの名前)と共にリスト作成
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.name), notice: "リスティングを作成・保存をしました"
    else
      redirect_to new_list_path, notice: "リスティングを作成・保存出来ませんでした"
    end
  end

  def edit
  end

  def update
  end

  private
  def list_params
    params.require(:list).permit(:name, :status)
  end
end
