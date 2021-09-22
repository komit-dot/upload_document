class HomesController < ApplicationController
  def welcome
    @posts = Post.where(shared: true)
  end
end