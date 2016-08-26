class Review < ApplicationRecord
    include HTTParty
    include Nokogiri
    include OpenURI

    base_uri 'https://gateway.watsonplatform.net/tone-analyzer'
    basic_auth ENV[USERKEY], ENV[PASSKEY]
    format :json
    belongs_to :traveler
    belongs_to :host

    def assign_tone
      response = get('/api/v3/tone?version=2016-05-19', :query => {:text => self.body})
      self.review_positive?(response)
    end

    def review_positive?
      anger = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][0]["score"]
      disgust = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][1]["score"]
      fear = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][2]["score"]
      average_negative = (anger + disgust + fear)/3
      #if average of these is higher than joy, respond false
      joy = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][3]["score"]

      self.review_positive = true
      self.save
    end

end
