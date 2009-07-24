require 'rho/rhocontroller'
class CategoryController < Rho::RhoController

  #GET /Category
  def index
    @categories = Category.find(:all)
    render
  end

  # GET /Category/{1}
  def show
    @category = Category.find(@params['id'])
    p=Product.new
    p.object="qparms"
    p.category_id = @category.id
    p.save  
    @products = p
    render :action => :show
  end

  # GET /Category/new
  def new
    @category = Category.new
    render :action => :new
  end

  # GET /Category/{1}/edit
  def edit
    @category = Category.find(@params['id'])
    render :action => :edit
  end

  # POST /Category/create
  def create
    @category = Category.new(@params['category'])
    @category.save
    redirect :action => :index
  end

  # POST /Category/{1}/update
  def update
    @category = Category.find(@params['id'])
    @category.update_attributes(@params['category'])
    redirect :action => :index
  end

  # POST /Category/{1}/delete
  def delete
    @category = Category.find(@params['id'])
    @category.destroy
    redirect :action => :index
  end
end
