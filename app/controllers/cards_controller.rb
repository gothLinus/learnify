class CardsController < ProtectedResourceController
  #before_action :set_and_authorize_card, only: [:show, :update, :destroy, :edit]
  def new
    @card = Card.new
    @collections = current_user.collection.all
    authorize @card
    render 'pages/cards/new'
  end
  def create
    @collection = current_user.collection.find(params[:collection_id])
    @card = @collection.cards.build(card_params.except(:timer, :images))
    authorize @card

    if @card.save
      @card.create_timer(time: card_params[:timer]) if card_params[:timer].present?
      @card.images.attach(card_params[:images]) if card_params[:images].present?

      redirect_to @card, message: "Card created successfully"
    else
      redirect_back fallback_location: root_path, flash: { message: @card.errors.full_messages.to_sentence }
    end
  end

  private
  def set_and_authorize_card
    @card = current_user.cards.find(params[:id])
    authorize @card
  end
  def card_params
    params.require(:card).permit(:title, :description, :timer, images: [])
  end
end
