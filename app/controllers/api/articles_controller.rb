class Api::ArticlesController < ApplicationController

  def index
    @articles = HTTP
      .auth("Bearer #{request.authorization}")
      .get("http://newsapi.org/v2/everything?q=#{params[:search]}&from=2021-01-01&sortBy=publishedAt").parse["articles"]
    render "index.json.jb"
  end

end
