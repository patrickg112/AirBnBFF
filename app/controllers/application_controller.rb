class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#Emotional Analysis Helpers

  def traits(user)
      traits = []
      # byebug
      traits << emo_analysis(user.openness, "open")
      # byebug
      traits << emo_analysis(user.conscientiousness, "conscientious")
      traits << emo_analysis(user.extraversion, "extraverted")
      traits << emo_analysis(user.agreeableness, "agreeable")
      traits << emo_analysis(user.emotional_range, "neurotic")
      traits
  end

  def emo_analysis(emo_val, emo_name)
    if emo_val <= 0.2
      "not very #{emo_name}"
    elsif 0.3 <= emo_val && emo_val <= 0.6
      "#{emo_name}"
    elsif emo_val >= 0.7
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

  def host_recommendations(host)
    travelers = Traveler.all
    matches = []
    travelers.each do |traveler|
      if (traits(host) & traits(traveler)).length >= 3
        matches << traveler
      end
    end
    matches
  end

end
