class RadpostauthController < ApplicationController
  def index
    @radpostauths = Radpostauth.paginate(page: params[:page], per_page: 20)
  end

  def show
    @radpostauth = Radpostauth.find_by_id(params[:id])
  end

  def today
    @radpostauths = Radpostauth.today
    @radpostauths_by_hours = @radpostauths.group_by(&:hour)
    @counts = []
    @radpostauths_by_hours.each do |key, array|
      @counts << [key, array.length]
    end
  end

end
