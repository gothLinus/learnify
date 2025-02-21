class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only: %i[show edit update destroy]
  before_action :authorize_collection, only: %i[show edit update destroy]
    def index
      @collections = policy_scope(Collection).paginate(page: params[:page], per_page: 9)
    render 'pages/collections/index'
  end

  def show
    render 'pages/collections/show'
  end

  def new
    @collection = Collection.new
    authorize @collection
    render 'pages/collections/new'
  end

  def create
    @collection = current_user.collection.new(collection_params)
    authorize @collection

    if @collection.save
      redirect_to @collection, notice: "Collection created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: "Collection updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path, notice: "Collection deleted"
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def authorize_collection
    authorize @collection
  end

  def collection_params
    params.require(:collection).permit(:name)
  end
end
