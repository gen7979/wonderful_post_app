class MypageController < ArticlesController

  def index
    # binding.pry
    @articles = Article.all
    # binding.pry
  end

  # 新規作成の処理
  def new
    # 新規オブジェクトの作成
    @article = Article.new
  end

  # 編集の処理
  def edit
    # 対象のオブジェクトを取得
  end

  # 削除の処理
  def destroy
  end
end
