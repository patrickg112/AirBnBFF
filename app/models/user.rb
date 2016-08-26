class User < ApplicationRecord
  include HTTParty
  include Nokogiri
  include OpenURI

  base_uri 'https://gateway.watsonplatform.net/tone-analyzer'
  basic_auth ENV[USERKEY], ENV[PASSKEY]
  format :json

  def assign_personality
    doc = Nokogiri::HTML(open(self.profile_link))
    text = doc.css('div.space-top-2').children.css('p').text
    response = get('/api/v3/tone?version=2016-05-19', :query => {:text => text})
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

  def review_positive?
    # doc = Nokogiri::HTML(open(self.profile_link))
    # text = doc.css('div.space-top-2').children.css('p').text
    # response = get('/api/v3/tone?version=2016-05-19', :query => {:text => text})
    anger = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][0]["score"]
    disgust = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][1]["score"]
    fear = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][2]["score"]
    #if average of these is higher than joy, respond false
    joy = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][3]["score"]

    # sadness = response.parsed_response["document_tone"]["tone_categories"][0]["tones"][4]["score"]
    # analytical = response.parsed_response["document_tone"]["tone_categories"][1]["tones"][0]["score"]
    # confident = response.parsed_response["document_tone"]["tone_categories"][1]["tones"][1]["score"]
    # tentative = response.parsed_response["document_tone"]["tone_categories"][1]["tones"][2]["score"]
  end

end
