class ArticlesController < ApplicationController
   skip_before_action :authenticate_user!, only: %i[ index show ] # 追加
   before_action :set_article, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    # @articles = Article.all
    @articles = Article.all.page(params[:page]).per(10)
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to mypage_url(@article), notice: "記事を作成しました" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to mypage_url(@article), notice: "記事を更新しました" }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to mypage_index_url, notice: "記事を削除しました" }
      format.json { head :no_content }
    end
  end

  def search
    search_title = params[:title]
    @articles = Article.where("title LIKE ?", "%#{search_title}%")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, tag_ids: []) #複数なので配列
    end
end
