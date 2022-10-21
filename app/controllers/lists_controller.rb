class ListsController < ApplicationController
  # インスタンス変数は指定しておかないとviewファイルで使えない
  def new
    # 空のインスタンスを作成＠はviewファイルに渡すときに使うインスタンス変数
    @list = List.new
  end

  def create
    # データを受け取り空のインスタンスを作成,(list_params)はストロングパラメータ
    @list = List.new(list_params)
    # 代入したデータを保存
    if @list.save
      # list_path = "/lists/#{list.id}" list_pathのlistはroutesの〜,as:で設定した値
      redirect_to list_path(@list.id)
    else
      # indexにリダイレクトするにはindexと同じ処理をする必要がある。
      # index.htmlには@listsが定義。@lists = List.allであるため同じように追記
      # @lists = List.all
      # render :index
      render :new
    end
  end

  def index
    # @lists：全件表示の為複数形、List.all:リストに入力してあるもののすべてのデータ
    @lists = List.all
  end

  def show
    # paramas[:id]は対象のidを表す。id:1なら、List.find(1)のような処理になる
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    # idの一致するデータを探し＠listに代入
    list =List.find(params[:id])
    # @listをアップデート
    if list.update(list_params)
      redirect_to list_path(list.id)
    else
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  # ストロングパラメータrequire(:モデル名).permit(:許可するカラム名,~)
  private
  def list_params
    params.require(:list).permit(:title, :body,:image)
  end
end
