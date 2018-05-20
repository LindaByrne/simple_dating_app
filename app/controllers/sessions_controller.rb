# frozen_string_literal: true

# Session Controller
#

class SessionsController < ApplicationController
  def initialize
    @google_token_info_url = "https://www.googleapis.com/oauth2/v3/tokeninfo"
    # TODO: this should probably be static, or maybe inline
  end

  def validate(id_token)
    response = RestClient.post(@google_token_info_url, id_token)
    JSON.parse(response.body)["sub"]
  rescue RestClient::ExceptionWithResponse => e
    puts "Error validating token " + e.message
    nil
  end

  def find_user(google_userid)
    User.find_by(google_userid: google_userid)
  end

  def new
    id_token = {id_token: params["token"]}
    google_uid = validate(id_token)
    user = find_user(google_uid)
    session["g_user_id"] = google_uid
    if user
      session["user_id"] = user.id
      redirect_to "/users/" + user.id
    else
      redirect_to "/signup/" + google_uid
    end
  end

  def login
  end
end
