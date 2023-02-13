class ArticlesController < ApplicationController
  # before_action :set_article, only: [:edit, :update, :show, :destroy]
  # def index
  #   @article = Article.all
  # end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end