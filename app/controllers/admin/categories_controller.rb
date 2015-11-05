class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
       session[:most_recent_category_id] = @category.id
       flash[:notice] = "You have created a new song category"
       redirect_to admin_categories_path
     else
       flash.now[:wrong] = "Invalid Category"
       render :new
     end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
