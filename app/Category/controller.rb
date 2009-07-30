require 'rho'
require 'rho/rhocontroller'
class CategoryController < Rho::RhoController

  #GET /Category
  def index  
    # TODO: should we have an application controller that handles auth?
    @logged_in = false # SyncEngine::logged_in
    @logged_in = SyncEngine::login("tester", "tester")
    @categories = Category.find(:all)
    @products=Product.find :all
    SyncEngine::dosync if @logged_in
    # Category.set_notification("/Category")  Error: wrong number of arguments (1 for 2)
    #SyncEngine.set_notification(2302, "/Category")
    render
  end

  # GET /Category/{1}
  def show
    @category = Category.find(@params['id'])
    @products = Product.find(:category_id => @params['id'])
    puts "======================================== show"
    puts "category=#{@category.name}"
    puts @products.inspect
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
