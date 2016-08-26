class Review < ApplicationRecord
    include HTTParty
    include Nokogiri
    include OpenURI

    belongs_to :traveler
    belongs_to :host
    before_save :assign_tone

    def assign_tone
      response = HTTParty.get( 'https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19', {:query => {:text => self.body}, :basic_auth => {:username => ENV['USERKEY'], :password => ENV['PASSKEY']} })
      self.review_positive?(response)
    end

    def review_positive?
      anger = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][0]["score"]
      disgust = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][1]["score"]
      fear = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][2]["score"]
      average_negative = (anger + disgust + fear)/3
      positive = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][3]["score"]
      if average_negative >= positive
        self.review_positive = false
      else
        self.review_positive = true
      end
      self.save
    end

end
