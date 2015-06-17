class AddStripeCustomerTokenToUsers < ActiveRecord::Migration
  def change
    add_colum :users, :stripe_customer_token, :string 
  end
end
