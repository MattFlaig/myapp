class CategoriesController < ApplicationController

before_action :require_user, except: [:index, :show]

def show
	@category = Category.find(params[:id])
end

def new
	@category = Category.new
end



def create
	@category = Category.new(category_params)

	if @category.save 
    flash[:notice] = "Your category was created"
    redirect_to posts_path
  else
    render 'new'
  end

end

#def edit
#	@category = Category.find(params[:id])
#end

#def update
#end

 private

  def category_params
    params.require(:category).permit!
  end



end