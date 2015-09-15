require "json"
require "mobilyws"
require "cuba"

auth_token = ENV["AUTH_TOKEN"]

Cuba.define do
  # set headers
  res.headers["Content-Type"] = "application/json; charset=utf-8"

  on post do
    
    user_token = env["HTTP_AUTHENTICATION"]
    on auth_token.eql?(user_token) do

      on "send" do
        on root do
          on param("mobile") do |mobile|
            sms = Mobilyws::API.new ENV["USERNAME"], ENV["PASSWORD"], ENV["SENDER_NAME"]
            name = req.params.fetch('name', '')
            message = ENV["MESSAGE"] % [name]
            response = sms.send(message: message, numbers: [mobile])
            response_message  = {status: :sent, message: response}.to_json
            res.write response_message
          end

          # If the params `mobile` is not provided, this
          # block will get executed.
          on true do
            error_message = {status: :error, message: "mobile number missing"}.to_json
            res.write error_message
          end
        end
        
      end
      
    end
  end
end