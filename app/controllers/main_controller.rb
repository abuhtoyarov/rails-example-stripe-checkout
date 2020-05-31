class MainController < ApplicationController
  def index
  end

  def init
    render json: {
      publicKey: ENV['STRIPE_PUBLISHABLE_KEY'],
      basePrice: ENV['BASE_PRICE'],
      currency: ENV['CURRENCY'],
    }, status: :ok
  end
end
