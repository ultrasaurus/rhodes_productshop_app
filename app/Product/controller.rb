require 'rho/rhocontroller'

class ProductController < Rho::RhoController

  #GET /Product
  def index
    @products = Product.find(:all)
    render
  end

  # GET /Product/{1}
  def show
    @product = Product.find(@params['id'])
    render :action => :show
  end

  # GET /Product/new
  def new
    @product = Product.new
    render :action => :new
  end

  # GET /Product/{1}/edit
  def edit
    @product = Product.find(@params['id'])
    render :action => :edit
  end

  # POST /Product/create
  def create
    @product = Product.new(@params['product'])
    @product.save
    redirect :action => :index
  end

  # POST /Product/{1}/update
  def update
    @product = Product.find(@params['id'])
    @product.update_attributes(@params['product'])
    redirect :action => :index
  end

  # POST /Product/{1}/delete
  def delete
    @product = Product.find(@params['id'])
    @product.destroy
    redirect :action => :index
  end
end
