class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    quantity = params[:quantity]
    locale = params[:locale]

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    session = Stripe::Checkout::Session.create({
      success_url: "#{ENV['BASE_DOMAIN']}/success?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: "#{ENV['BASE_DOMAIN']}/cancel",
      payment_method_types: ['card'],
      line_items: [
        { 
          name: 'Photo', 
          quantity: quantity, 
          currency: ENV['CURRENCY'],
          images: ['https://picsum.photos/300/300?random=4'],
          amount: ENV['BASE_PRICE']
        },
      ],
    })

    render json: { sessionId: session.id }, status: :ok
  end

  def cancel
  end


  def success
  end
end
