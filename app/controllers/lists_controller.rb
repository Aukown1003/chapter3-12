class ListsController < ApplicationController
  # インスタンス変数は指定しておかないとviewファイルで使えない
  def new
    # 空のインスタンスを作成＠はviewファイルに渡すときに使うインスタンス変数
    @list = List.new
  end
  
  def create
    # データを受け取り空のインスタンスを作成,(list_params)はストロングパラメータ
    list = List.new(list_params)
    # 代入したデータを保存
    list.save
    # top画面に移動
    redirect_to "/top"
  end

  def index
    # @lists：全件表示の為複数形、List.all:リストに入力してあるもののすべてのデータ
    @lists = List.all
  end

  def show
  end

  def edit
  end
  
  # ストロングパラメータrequire(:モデル名).permit(:許可するカラム名,~)
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
