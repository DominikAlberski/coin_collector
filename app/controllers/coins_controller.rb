class CoinsController < ApplicationController
  def index
    render inertia: "coins/index", props: { coins: coins }
  end

  private

  def coins
    @coins ||= Coin.all
    @coins.present? ? @coins : FakeCoin.collection
  end

  class FakeCoin
    attr_accessor :id

    def self.collection
      2.times.map { new(_1).to_hash }
    end

    def initialize(_index)
      self.id = _index + 1
    end

    def to_hash
      {
        id: id,
        name: name,
        release_year: release_year,
        mint_name: mint_name,
        weight: weight,
        weight_category: weight_category
      }
    end

    def name
      "Fake Coin"
    end

    def release_year
      2022
    end

    def mint_name
      "Fake Mint"
    end

    def weight
      31.1035
    end

    def weight_category
      "oz_1"
    end
  end
end
