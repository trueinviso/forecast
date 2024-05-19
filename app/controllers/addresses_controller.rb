# frozen_string_literal: true

class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = FindOrInitializeAddress.new(address_params).call

    if @address.save
      @forecast = Weather::Forecast.new(@address)
      @weather = @forecast.call

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            :address_form,
            partial: "addresses/form",
            locals: { address: @address },
          )
        end
      end
    end
  end

  private

  def address_params
    params
      .require(:address)
      .permit(:street, :locality, :division, :postal_code)
  end
end
