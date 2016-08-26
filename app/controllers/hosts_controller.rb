class HostsController < ApplicationController

  def index
    @hosts = Host.all
  end

  def show
    @host = Host.find(params[:id])
    @recommendations = host_recommendations(@host)
  end

  def requests
    @host = Host.find(params[:id])
    @requests = @host.requests
  end

end
