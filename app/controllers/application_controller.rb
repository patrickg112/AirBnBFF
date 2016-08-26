class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#Emotional Analysis Helpers

  def traits(user)
      traits = []
      # byebug
      traits << emo_analysis(user.openness, "open")
      traits << emo_analysis(user.conscientiousness, "conscientious")
      traits << emo_analysis(user.extraversion, "extraverted")
      traits << emo_analysis(user.agreeableness, "agreeable")
      traits << emo_analysis(user.emotional_range, "neurotic")
      traits
  end

  def emo_analysis(emo_val, emo_name)
    case emo_val
    when emo_val <= 2
      "not very #{emo_name}"
    when emo_val = 3
      "#{emo_name}"
    when emo_val >= 4
      "very #{emo_name}"
    else
      "inconclusive"
    end
  end

  def recommend(traveler)
    hosts = Host.all
    matches = []
    hosts.each do |host|
      if (traits(host) & traits(traveler)).length >= 3
        matches << host
      end
    end
    matches
  end

end
