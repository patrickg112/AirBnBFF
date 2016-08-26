module Assessment
  include HTTParty
  include Nokogiri
  include OpenURI

  base_uri 'https://gateway.watsonplatform.net/tone-analyzer'
  basic_auth ENV[USERKEY], ENV[PASSKEY]
  format :json


  def self.get_personality(info)
    get('/api/v3/tone?version=2016-05-19', :query => {:text => info})
  end


end

link = self.profile_link
doc = Nokogiri::HTML(open(link))
text = doc.css('div.space-top-2').children.css('p').text
v = Assessment.get_personality(text)

openness = v.parsed_response["document_tone"]["tone_categories"][2]["tones"][0]["score"]
conscientiousness = v["document_tone"]["tone_categories"][2]["tones"][1]["score"]
extraversion = v["document_tone"]["tone_categories"][2]["tones"][2]["score"]
agreeableness = v["document_tone"]["tone_categories"][2]["tones"][3]["score"]
emotional_range = v["document_tone"]["tone_categories"][2]["tones"][4]["score"]

anger = v["document_tone"]["tone_categories"][0]["tones"][0]["score"]
disgust = v["document_tone"]["tone_categories"][0]["tones"][1]["score"]
fear = v["document_tone"]["tone_categories"][0]["tones"][2]["score"]

joy = v["document_tone"]["tone_categories"][0]["tones"][3]["score"]

sadness = v["document_tone"]["tone_categories"][0]["tones"][4]["score"]
analytical = v["document_tone"]["tone_categories"][1]["tones"][0]["score"]
confident = v["document_tone"]["tone_categories"][1]["tones"][1]["score"]
tentative = v["document_tone"]["tone_categories"][1]["tones"][2]["score"]
