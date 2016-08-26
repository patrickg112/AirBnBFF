class Host < ApplicationRecord
    include HTTParty
    include Nokogiri
    include OpenURI
    has_many :reviews, as: :reviewable, dependent: :destroy
    has_many :requests
    # before_save :assign_personality

    base_uri 'https://gateway.watsonplatform.net/tone-analyzer'
    basic_auth ENV['USERKEY'], ENV['PASSKEY']
    format :json



    def assign_personality
      response = HTTParty.get('/api/v3/tone?version=2016-05-19', :query => {:text => self.bio})
      self.set_values(response)
    end

    def set_values(response)
      self.openness = response.parsed_response["document_tone"]["tone_categories"][2]["tones"][0]["score"]
      self.conscientiousness = response.parsed_response["document_tone"]["tone_categories"][2]["tones"][1]["score"]
      self.extraversion = response.parsed_response["document_tone"]["tone_categories"][2]["tones"][2]["score"]
      self.agreeableness = response.parsed_response["document_tone"]["tone_categories"][2]["tones"][3]["score"]
      self.emotional_range = response.parsed_response["document_tone"]["tone_categories"][2]["tones"][4]["score"]
      self.save
    end


end
