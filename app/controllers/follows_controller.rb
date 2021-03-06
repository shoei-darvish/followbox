class FollowsController < ApplicationController
  def index
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follow_params)
    @list = @follow.list
    @nickname = @follow.nickname
    if Follow.exists?(nickname: @nickname, list: @list)
      redirect_to new_follow_path, notice: "既にそのフォローボックスには同じアカウントが存在しています"
    else
      if @follow.save then
        redirect_to lists_path, notice: "フォローボックスにアカウントを作成しました"
      else
        redirect_to lists_path, notice: "フォローボックスにアカウントを作成・保存出来ませんでした"
      end
    end
  end

  def edit
  end

  def delete
  end

  def show
  end

  def update
  end

  private

  def follow_params
    params.require(:follow).permit(:name, :nickname, :image, :list)
  end

end
