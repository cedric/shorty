class UrlsController < ApplicationController
  
  def index
    if params[:url] && params[:url][:url]
      @link = Url.find_or_create_by_url( params[:url][:url] )
      unless @link.save
        flash[:warning] = 'There was a problem generating your short url.'
      end
    else  
      @link = Url.new
    end
  end
  
  def redirect
    url = Url.find_by_token( params[:token] )
    unless url.nil?
      redirect_to url.url, { :status => 301 }
    else
      flash[:warning] = 'This short url does not exist.'
      redirect_to root_url, { :status => 301 }
    end
  end
  
end
