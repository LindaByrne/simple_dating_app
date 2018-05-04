class OauthController < ApplicationController
    def initialize()
        @GoogleTokenInfoURL = "https://www.googleapis.com/oauth2/v3/tokeninfo" #TODO: this should probably be static, or maybe inline
    end

    def validate
        payload = { id_token: params['token']}
        begin
            response = RestClient.post(@GoogleTokenInfoURL, payload, headers={})
            redirect_to "/sessions/new/" +  URI.escape(JSON.parse(response.body)['sub'])
        rescue RestClient::ExceptionWithResponse => e
            puts "Error validating token " + e
        end
    end
end
