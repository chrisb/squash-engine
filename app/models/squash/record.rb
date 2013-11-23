module Squash
  class Record < ActiveRecord::Base
    establish_connection "squash_#{::Rails.env}"
  end
end