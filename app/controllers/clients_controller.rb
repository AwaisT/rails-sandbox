class ClientsController < ApplicationController
  # This action uses query string parameters because it gets run
  # by an HTTP GET request, but this does not make any difference
  # to the way in which the parameters are accessed. The URL for
  # this action would look like this in order to list activated
  # clients: /clients?status=activated
  def index

    if params[:status]
      flash[:notice] = params[:status] + params[:action]
    else
      flash[:notice] = 'there needs to be activated'
    end
  end

 def new
   @clinet  = Client.new

 end
 def show

  @client = Client.find(params[:id])

 end

 def update
    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      redirect_to @client
    else
      render 'edit'
    end
 end

  # This action uses POST parameters. They are most likely coming
  # from an HTML form which the user has submitted. The URL for
  # this RESTful request will be "/clients", and the data will be
  # sent as part of the request body.
  def create
    #render plain: params[:client].inspect

    @client = Client.new(params[:id])
    if @client.save
      redirect_to @client
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  private

  def client_params
  params.require(:client).permit(:status)
end

end
