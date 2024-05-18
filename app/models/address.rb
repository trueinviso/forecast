# frozen_string_literal: true

class Address < ApplicationRecord
  geocoded_by :geocode_address

  before_validation :set_full_address
  after_validation :geocode

  validates :street,
            :locality,
            :division,
            :postal_code,
            :full_address,
            presence: true

  validates :full_address, uniqueness: true

  def geocode_address
    [street, locality, "#{division} #{postal_code}".strip]
      .compact
      .join(', ')
      .strip
      .presence
  end

  private

  def set_full_address
    self.full_address = [street, locality, division, postal_code].join(', ')
  end
end
