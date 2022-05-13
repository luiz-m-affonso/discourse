# frozen_string_literal: true

class UserStatus < ActiveRecord::Base
  belongs_to :user

  validate :ends_at_is_in_future

  def ends_at_is_in_future
    if ends_at && set_at > ends_at
      errors.add(:ends_at, I18n.t("user_status.errors.ends_at_should_be_in_the_future"))
    end
  end
end
