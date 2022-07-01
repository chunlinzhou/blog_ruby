class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(artiecle_params)
    if @article.save
      flash[:success] = "Object successfully created"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      if @article.update(artiecle_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @article
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  private
    def artiecle_params
      params.require(:article).permit(:title, :body)
      end
end
