class SightingSerializer
  attr_accessor :sighting

  def initialize(sighting)
    self.sighting = sighting
  end

  def to_serialized_json
    options = {
      :include => {
        :bird => {
          :only =>[:name, :species]
        }, 
        :location => {
          :only =>[:latitude, :longitude]
        }
      }, 
      :except => [:updated_at]
    }
    self.sighting.to_json(options)
  end

end