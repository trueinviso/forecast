# frozen_string_literal: true

class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = FindOrInitializeAddress.new(address_params).call

    if @address.save
      redirect_to forecasts_path(address_id: @address.id)
    else
      render :new
    end
  end

  private

  def address_params
    params
      .require(:address)
      .permit(:street, :locality, :division, :postal_code)
  end
end
