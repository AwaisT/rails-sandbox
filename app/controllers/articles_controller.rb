
require "prawn"
class ArticlesController < ApplicationController

 #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
USERS = { "lifo" => "world" }
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @my_message = 'Some Message'
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
      #render plain: params[:article].inspect
      #@article = Article.new(params[:article])
      #@article = Article.new(params.require(:article).permit(:title, :text))
      @article = Article.new(article_params)

      if @article.save

        flash[:notice] = "Article successfully created"

      redirect_to @article
      else
      render 'new'
    end

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
 end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = "Article Deleted"
  redirect_to articles_path
end

def download_pdf
  article = Article.find(params[:id])
    send_data generate_pdf(article),
              filename: "#{article.title}.pdf",
              type: "application/pdf"

end

def generate_pdf(article)
      Prawn::Document.new do
        text article.title, align: :center

      end.render
    end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
