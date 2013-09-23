class LocationNotFound < StandardError
  attr_reader :location

  def initialize(location)
    @location = location
  end
end