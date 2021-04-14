class CsvImporterExporter
  attr_accessor :file, :export_type

  def initialize(file=nil, export_type=nil)
    @file = file
    @export_type = export_type
  end

  def self.import(file)
    new(file).import
  end

  def self.generate_csv(export_type)
    new(nil, export_type).generate_csv
  end

  def import
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = User.where(email: row['Email']).first_or_create(name: row['Name'], nationality: row['Nationality'])
      next if Vehicle.exists?(chassis_number: row['ChassisNumber'])

      vehicle = Vehicle.new(model: row['Model'], year: row['Year'],
                            chassis_number: row['ChassisNumber'], color: row['Color'],
                            registration_date: row['RegistrationDate'].to_date,
                            odometer_reading: row['OdometerReading'])
      vehicle.user = user
      vehicle.save!
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def generate_csv
    case export_type
    when 'customer'
      attributes = %w(nationality total_customers)
      CSV.generate(headers: true) do |csv|
        csv << attributes

        User.all.group_by(&:nationality).each do |nationality, users|
          csv << [nationality, users.length]
        end
      end
    when 'odometer_reading'
      attributes = %w(nationality average_odometer_reading)
      CSV.generate(headers: true) do |csv|
        csv << attributes
        list = Vehicle.all.group_by { |vehicle| vehicle.user.nationality }
        list.each do |nationality, vehicles|
          csv << [nationality, (vehicles.map(&:odometer_reading).inject(0, &:+) / vehicles.length)]
        end
      end
    else
      raise 'Invalid type!'
    end
  end
end
