class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.search(params[:search])
  end

  def import
    CsvImporterExporter.import(params[:file])
    redirect_to root_url, notice: 'File imported!'
  rescue => e
    redirect_to root_url, alert: 'Invalid format!'
  end

  def export
    respond_to do |format|
      format.html
      format.csv do
        send_data CsvImporterExporter.generate_csv(params[:export_type]),
                  filename: "#{params[:export_type]}_by_nationality.csv"
      end
    end
  rescue
    redirect_to root_url, alert: 'Invalid type!'
  end
end
