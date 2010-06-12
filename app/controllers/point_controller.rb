class PointController < ApplicationController
  def since
    if params[:id]
      @points = Point.find :all, :conditions => [ "moment >= ?", params[:id] ]
    else
      @points = Point.all
    end

    json = @points.collect do |p|
      { "latitude" => p.latitude,
        "longitude" => p.longitude,
        "title" => p.title }
    end.to_json
    render :text => json
  end

  def create
    @point = Point.new
  end

  def new
    @point = Point.new "latitude" => params[:latitude], "longitude" => params[:longitude], "title" => params[:title]
    @point.save
    render :text => @point.to_json
  end
end
