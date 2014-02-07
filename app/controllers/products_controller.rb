require 'open-uri'

class ProductsController < ApplicationController
  def index
    page = params[:page] || 1
    products_json = open("http://lcboapi.com/products?page=#{page}").read
    @products = JSON.parse(products_json)
  end

  def search
    search = params[:search]
    page = params[:page] || 1
    if search
      results_json = open("http://lcboapi.com/products?q=#{search}&page=#{page}").read
      @results = JSON.parse(results_json)
      @results[:search] = search
    end
  end

  def show
    products_json = open("http://lcboapi.com/products/#{params[:id]}").read
    @product = JSON.parse(products_json)
  end
end

# lcboapi

# class ProductsController
#   def index
#     params[:page] # == 1
#     params[:poop] #== 3000
#   end
# end
