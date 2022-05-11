# frozen_string_literal: true

class UserStatus < ActiveRecord::Base
  belongs_to :user
end
