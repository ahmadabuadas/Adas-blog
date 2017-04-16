class ArticlesController < ApplicationController
    before_action :set_article, only:[:edit, :update, :show, :destroy]
    def new
        @article = Article.new
    end
    
    def index
        @articles =Article.all
    end
    
    def edit 
       set_article
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "article was sucssess add"
            redirect_to article_path (@article)
        else 
         render 'new'
        end
    end
    
    def update
        set_article
        if @article.update(article_params)
            flash[:notice] = "article was sucssess updated"
            redirect_to article_path (@article)
        else 
         render 'edit'
        end
    end
    
    def show
        set_article
    end
    
    def destroy
        set_article
        @article.destroy
        flash[:notice] = "articale was sucssess deleted"
        redirect_to articles_path
    end
    
    
    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
end
