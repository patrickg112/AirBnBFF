class Request < ApplicationRecord
  belongs_to :host
  belongs_to :traveler
end
