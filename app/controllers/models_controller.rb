class ModelsController < ApplicationController
  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])
  end

  def new
    @model = Model.new
    @makes = Make.all
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      flash[:success] = "Model added"
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
    @makes = Make.all
  end

  def update
    @model = Model.find(params[:id])
    if @model.update_attributes(model_params)
      flash[:success] = "Model updated"
      redirect_to action: "index"
    else
      render 'edit'
    end
  end
  
 private
  def model_params
    params.require(:model).permit(:make_id, :name)
  end
end
