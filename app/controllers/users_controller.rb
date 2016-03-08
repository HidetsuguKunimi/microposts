class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def show
    @user=User.find(params[:id])
    @microposts =@user.microposts.order(created_at: :desc)
  end

  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the sample App!"
      redirect_to @user 
    else
      render 'new'
    end
  end
  
#追加
  def edit
    @user=User.find(params[:id])
  end

#追加
  def destroy
    @user.destroy
    redirect_to root_path , notice: 'ユーザー情報を削除しました'
  end
  
#追加
  def update
    if @user.update(user_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to user_path , notice: 'ユーザー情報を更新しました'
    else
      #保存に失敗した場合には編集画面に戻す
      render 'edit'
    end
  end


  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def set_user
    @user=User.find(params[:id])
  end


end
