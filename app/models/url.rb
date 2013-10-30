require 'uri'

class Url < ActiveRecord::Base
  validates :main_url, presence: true

  def validate?
    uri = URI(self.main_url)
    if uri.scheme == "http"
      return true
    end
  end

  def upcount
    self.counter += 1
    puts self.counter
    self.save
  end
end

