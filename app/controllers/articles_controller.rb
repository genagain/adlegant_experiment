class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    url = params["article"]["url"]
    body = analyze(url)
    @article = Article.new( url: url, title: body["title"], author: body["author"], summary: body["summary"].join(" "), image_url: body["image"])
    @article.save
    body["tags"].each do |tag|
      @tag = Tag.find_or_create_by(word: tag)
      @article_tag = ArticleTag.create(article_id: @article.id, tag_id: @tag.id)
    end
    redirect_to articles_path(@article)
  end

  def show
    @article = Article.find(params["format"])
    @tags = @article.get_tags
  end

  protected

  def analyze(article_url)
    @response = Unirest.get "https://joanfihu-article-analysis-v1.p.mashape.com/link?entity_description=False&link=#{article_url}",
      headers:{
        "X-Mashape-Key" => "S9eb6rG5NMmshJ25ZHBWBzFxzZ9zp14doUMjsnxF9244L0R13F",
        "Accept" => "application/json"
    }
    @response.body
  end
end

