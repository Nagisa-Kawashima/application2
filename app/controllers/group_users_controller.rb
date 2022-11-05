class GroupUsersController < ApplicationController
  before_action :authenticate_user!

  def create
    group_user = current_user.group_users.new(group_id: params[:group_id])
    group_user.save
    redirect_to request.referer

  end

  def destroy
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to request.referer
  end
end


# Referer リクエストヘッダーには、現在リクエストされているページへのリンク先を持った直前のウェブページのアドレスが含まれています。
# Referer ヘッダーにより、サーバーは人々がどこから訪問しに来たかを識別し、分析、ログ、キャッシュの最適化などに利用することができます。
# リクエストを送ってきたユーザのヘッダー情報や環境変数を取得
# request.メソッド()