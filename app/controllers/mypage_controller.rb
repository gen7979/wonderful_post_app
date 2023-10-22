class MypageController < ArticlesController

  def index
    articles = Article.all

    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?

    @articles = articles.page params[:page]
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

  # def search
  #   search_title = params[:title]
  #   @articles = Article.where("title LIKE ?", "%#{search_title}%")
  # end
end
