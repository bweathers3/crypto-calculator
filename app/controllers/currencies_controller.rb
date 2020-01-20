class CurrenciesController < ActionController::Base
  def indeex
  end

  def search
    @currencies = Currency.where('Lower(name) Like ?', "%#{params[:search].downcase}%")
    render json: { currencies: @currencies}
  end

  #takes in the currency id and the amoun owned
  #returns final calculations
  def calculate
    amount = params[:amount]
    render json: {
      currency: currency,
      current_price: currency.current_price,
      amount: amount,
      value: currency.calculate_value(amount)
    }
  end


  private

  def currency
    @currency ||= Currency.find(params[:id])
  end
end
