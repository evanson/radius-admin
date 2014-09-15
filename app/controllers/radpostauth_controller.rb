class RadpostauthController < ApplicationController
  def index
    @radpostauths = Radpostauth.paginate(page: params[:page], per_page: 20)
  end

  def show
    @radpostauth = Radpostauth.find_by_id(params[:id])
  end

end
