def search
  search_title = params[:title]
  @articles = Article.where("title LIKE ?", "%#{search_title}%")
end
