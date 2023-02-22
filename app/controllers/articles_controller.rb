# frozen_string_literal: true

class ArticlesController < ApplicationController
  # before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully edited'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @articles = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy(article_params)
      flash[:notice] = 'Article was successfully deleted'
      redirect_to articles_path
    else
      render 'index'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
