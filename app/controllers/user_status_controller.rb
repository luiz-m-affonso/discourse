# frozen_string_literal: true

class UserStatusController < ApplicationController
  requires_login

  def set
    Rails.logger.warn("set custom status")
    render json: success_json
    # raise Discourse::InvalidParameters.new(:duration) if params[:duration].blank?
    #
    # duration_minutes = (Integer(params[:duration]) rescue false)
    #
    # ends_at = duration_minutes ?
    #   ends_at_from_minutes(duration_minutes) :
    #   ends_at_from_string(params[:duration])
    #
    # new_timing = current_user.do_not_disturb_timings.new(starts_at: Time.zone.now, ends_at: ends_at)
    #
    # if new_timing.save
    #   current_user.publish_do_not_disturb(ends_at: ends_at)
    #   render json: { ends_at: ends_at }
    # else
    #   render_json_error(new_timing)
    # end
  end

  def clear
    Rails.logger.warn("delete custom status")
    # current_user.active_do_not_disturb_timings.destroy_all
    # current_user.publish_do_not_disturb(ends_at: nil)
    # current_user.shelved_notifications.each(&:process)
    # current_user.shelved_notifications.destroy_all
    # render json: success_json
    render json: success_json
  end

  private

end
