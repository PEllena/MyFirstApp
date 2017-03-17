class PaymentsController < ApplicationController
	before_action :authenticate_user!
	def create
	  token = params[:stripeToken]
	  @product = Product.find(params[:product_id])
	  @user = current_user
	  
	  begin
	    charge = Stripe::Charge.create(
	      :amount => @product.price.to_i * 100,
	      :currency => 'usd',
	      :source => token,
	      :description => params[:stripeEmail]
	      )
	  	if charge.paid
		    Order.create(
		      :product_id => @product_id,
		      :user_id => @user_id,
		      :total => @total
		      )
		  end

		  rescue Stripe::CardError => e
		    body = e.json_body
	    	err = body[:error]
	    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  	end
	  redirect_to product_path(@product), notice: 'Your payment has been processed.'
	end
end
