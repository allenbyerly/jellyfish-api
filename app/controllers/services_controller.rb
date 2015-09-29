class ServicesController < ApplicationController
  SERVICE_INCLUDES = %w(alerts latest_alerts order project product product_type)

  after_action :verify_authorized

  api :GET, '/services', 'Returns all services'
  param :includes, Array, in: SERVICE_INCLUDES
  param :page, :number
  param :per_page, :number

  def index
    authorize Service
    respond_with_params services
  end

  api :GET, '/services/:id', 'Returns a service'
  param :id, :number, required: true
  param :includes, Array, in: SERVICE_INCLUDES
  error code: 404, desc: MissingRecordDetection::Messages.not_found

  def show
    authorize service
    respond_with_params service, serializer: ServiceSerializer
  end

  private

  def services
    @_services ||= query_with Service.all, :includes, :pagination
  end

  def service
    @_service = Service.find params[:id]
  end
end
