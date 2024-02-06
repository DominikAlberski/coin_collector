class StaticPagesController < ApplicationController
  def index
    render inertia: "static_pages/index" #, props: { categories: @categories }
  end
end
