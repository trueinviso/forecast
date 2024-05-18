# frozen_string_literal: true

class FindOrInitializeAddress
  def initialize(address_params)
    @street = address_params[:street]
    @locality = address_params[:locality]
    @division = address_params[:division]
    @postal_code = address_params[:postal_code]
  end

  def call
    address = Address.find_or_initialize_by(full_address: full_address)

    return address if address.persisted?

    address.assign_attributes(
      street: street,
      locality: locality,
      division: division,
      postal_code: postal_code,
    )

    address
  end

  private

  attr_reader :street, :locality, :division, :postal_code

  def full_address
    [street, locality, division, postal_code].compact.join(', ')
  end
end
