##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class TokenList < ListResource
            ##
            # Initialize the TokenList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   {Account}[https://www.twilio.com/docs/iam/api/account] that created the Token
            #   resource.
            # @return [TokenList] TokenList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/Tokens.json"
            end

            ##
            # Create the TokenInstance
            # @param [String] ttl The duration in seconds for which the generated credentials
            #   are valid. The default value is 86400 (24 hours).
            # @return [TokenInstance] Created TokenInstance
            def create(ttl: :unset)
              data = Twilio::Values.of({'Ttl' => ttl, })

              payload = @version.create('POST', @uri, data: data)

              TokenInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.TokenList>'
            end
          end

          class TokenPage < Page
            ##
            # Initialize the TokenPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [TokenPage] TokenPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of TokenInstance
            # @param [Hash] payload Payload response from the API
            # @return [TokenInstance] TokenInstance
            def get_instance(payload)
              TokenInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.TokenPage>'
            end
          end

          class TokenInstance < InstanceResource
            ##
            # Initialize the TokenInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The SID of the
            #   {Account}[https://www.twilio.com/docs/iam/api/account] that created the Token
            #   resource.
            # @return [TokenInstance] TokenInstance
            def initialize(version, payload, account_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'ice_servers' => payload['ice_servers'],
                  'password' => payload['password'],
                  'ttl' => payload['ttl'],
                  'username' => payload['username'],
              }
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] An array representing the ephemeral credentials
            def ice_servers
              @properties['ice_servers']
            end

            ##
            # @return [String] The temporary password used for authenticating
            def password
              @properties['password']
            end

            ##
            # @return [String] The duration in seconds the credentials are valid
            def ttl
              @properties['ttl']
            end

            ##
            # @return [String] The temporary username that uniquely identifies a Token
            def username
              @properties['username']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Api.V2010.TokenInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Api.V2010.TokenInstance>"
            end
          end
        end
      end
    end
  end
end