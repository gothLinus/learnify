class CardsController < ProtectedResourceController
  before_action :set_card, except: [ :new, :create ]
  def new
    @card = Card.new
    render 'pages/cards/new'
  end
  def create
    @card = current_user.cards.build(card_params.except(:timer, :images))
    @card.build_collection(Collection())

    if @card.save
      @card.create_timer(time: card_params[:timer]) if card_params[:timer].present?
      @card.images.attach(card_params[:images]) if card_params[:images].present?

      redirect_to @card, message: "Card created successfully"
    else
      redirect_back fallback_location: root_path, flash: { message: @card.errors.full_messages.to_sentence }
    end
  end

  def card_params
    params.require(:card).permit(:title, :description, :timer, images: [])
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

end
