class Api::ArticlesController < ApplicationController

  def index
    @articles = HTTP
      # .auth(Rails.application.credentials.news_api[:api_key])
      .headers("X-Api-Key" => Rails.application.credentials.news_api[:api_key])
      .get("http://newsapi.org/v2/everything?q=#{params[:search]}&sortBy=publishedAt").parse["articles"]
    render "index.json.jb"
  end

end
