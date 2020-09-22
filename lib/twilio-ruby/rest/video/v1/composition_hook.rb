##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionHookList < ListResource
          ##
          # Initialize the CompositionHookList
          # @param [Version] version Version that contains the resource
          # @return [CompositionHookList] CompositionHookList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/CompositionHooks"
          end

          ##
          # Lists CompositionHookInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Boolean] enabled Read only CompositionHook resources with an `enabled`
          #   value that matches this parameter.
          # @param [Time] date_created_after Read only CompositionHook resources created on
          #   or after this {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] datetime with
          #   time zone.
          # @param [Time] date_created_before Read only CompositionHook resources created
          #   before this {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] datetime with
          #   time zone.
          # @param [String] friendly_name Read only CompositionHook resources with friendly
          #   names that match this string. The match is not case sensitive and can include
          #   asterisk `*` characters as wildcard match.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(enabled: :unset, date_created_after: :unset, date_created_before: :unset, friendly_name: :unset, limit: nil, page_size: nil)
            self.stream(
                enabled: enabled,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                friendly_name: friendly_name,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams CompositionHookInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Boolean] enabled Read only CompositionHook resources with an `enabled`
          #   value that matches this parameter.
          # @param [Time] date_created_after Read only CompositionHook resources created on
          #   or after this {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] datetime with
          #   time zone.
          # @param [Time] date_created_before Read only CompositionHook resources created
          #   before this {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] datetime with
          #   time zone.
          # @param [String] friendly_name Read only CompositionHook resources with friendly
          #   names that match this string. The match is not case sensitive and can include
          #   asterisk `*` characters as wildcard match.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(enabled: :unset, date_created_after: :unset, date_created_before: :unset, friendly_name: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                enabled: enabled,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                friendly_name: friendly_name,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields CompositionHookInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of CompositionHookInstance records from the API.
          # Request is executed immediately.
          # @param [Boolean] enabled Read only CompositionHook resources with an `enabled`
          #   value that matches this parameter.
          # @param [Time] date_created_after Read only CompositionHook resources created on
          #   or after this {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] datetime with
          #   time zone.
          # @param [Time] date_created_before Read only CompositionHook resources created
          #   before this {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] datetime with
          #   time zone.
          # @param [String] friendly_name Read only CompositionHook resources with friendly
          #   names that match this string. The match is not case sensitive and can include
          #   asterisk `*` characters as wildcard match.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CompositionHookInstance
          def page(enabled: :unset, date_created_after: :unset, date_created_before: :unset, friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Enabled' => enabled,
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'FriendlyName' => friendly_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            CompositionHookPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionHookInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CompositionHookInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CompositionHookPage.new(@version, response, @solution)
          end

          ##
          # Create the CompositionHookInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to  100 characters long and it must be unique within
          #   the account.
          # @param [Boolean] enabled Whether the composition hook is active. When `true`,
          #   the composition hook will be triggered for every completed Group Room in the
          #   account. When `false`, the composition hook will never be triggered.
          # @param [Hash] video_layout An object that describes the video layout of the
          #   composition hook in terms of regions. See {Specifying Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [String] audio_sources An array of track names from the same group room
          #   to merge into the compositions created by the composition hook. Can include zero
          #   or more track names. A composition triggered by the composition hook includes
          #   all audio sources specified in `audio_sources` except those specified in
          #   `audio_sources_excluded`. The track names in this parameter can include an
          #   asterisk as a wild card character, which matches zero or more characters in a
          #   track name. For example, `student*` includes tracks named `student` as well as
          #   `studentTeam`.
          # @param [String] audio_sources_excluded An array of track names to exclude. A
          #   composition triggered by the composition hook includes all audio sources
          #   specified in `audio_sources` except for those specified in
          #   `audio_sources_excluded`. The track names in this parameter can include an
          #   asterisk as a wild card character, which matches zero or more characters in a
          #   track name. For example, `student*` excludes `student` as well as `studentTeam`.
          #   This parameter can also be empty.
          # @param [String] resolution A string that describes the columns (width) and rows
          #   (height) of the generated composed video in pixels. Defaults to `640x480`.
          #   The string's format is `{width}x{height}` where:
          #
          #   * 16 <= `{width}` <= 1280
          #   * 16 <= `{height}` <= 1280
          #   * `{width}` * `{height}` <= 921,600
          #
          #   Typical values are:
          #
          #   * HD = `1280x720`
          #   * PAL = `1024x576`
          #   * VGA = `640x480`
          #   * CIF = `320x240`
          #
          #   Note that the `resolution` imposes an aspect ratio to the resulting composition.
          #   When the original video tracks are constrained by the aspect ratio, they are
          #   scaled to fit. See {Specifying Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [composition_hook.Format] format The container format of the media files
          #   used by the compositions created by the composition hook. Can be: `mp4` or
          #   `webm` and the default is `webm`. If `mp4` or `webm`, `audio_sources` must have
          #   one or more tracks and/or a `video_layout` element must contain a valid
          #   `video_sources` list, otherwise an error occurs.
          # @param [String] status_callback The URL we should call using the
          #   `status_callback_method` to send status information to your application on every
          #   composition event. If not provided, status callback events will not be
          #   dispatched.
          # @param [String] status_callback_method The HTTP method we should use to call
          #   `status_callback`. Can be: `POST` or `GET` and the default is `POST`.
          # @param [Boolean] trim Whether to clip the intervals where there is no active
          #   media in the Compositions triggered by the composition hook. The default is
          #   `true`. Compositions with `trim` enabled are shorter when the Room is created
          #   and no Participant joins for a while as well as if all the Participants leave
          #   the room and join later, because those gaps will be removed. See {Specifying
          #   Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @return [CompositionHookInstance] Created CompositionHookInstance
          def create(friendly_name: nil, enabled: :unset, video_layout: :unset, audio_sources: :unset, audio_sources_excluded: :unset, resolution: :unset, format: :unset, status_callback: :unset, status_callback_method: :unset, trim: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'Enabled' => enabled,
                'VideoLayout' => Twilio.serialize_object(video_layout),
                'AudioSources' => Twilio.serialize_list(audio_sources) { |e| e },
                'AudioSourcesExcluded' => Twilio.serialize_list(audio_sources_excluded) { |e| e },
                'Resolution' => resolution,
                'Format' => format,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
                'Trim' => trim,
            })

            payload = @version.create('POST', @uri, data: data)

            CompositionHookInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.CompositionHookList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionHookPage < Page
          ##
          # Initialize the CompositionHookPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CompositionHookPage] CompositionHookPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CompositionHookInstance
          # @param [Hash] payload Payload response from the API
          # @return [CompositionHookInstance] CompositionHookInstance
          def get_instance(payload)
            CompositionHookInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.CompositionHookPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionHookContext < InstanceContext
          ##
          # Initialize the CompositionHookContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the CompositionHook resource to fetch.
          # @return [CompositionHookContext] CompositionHookContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/CompositionHooks/#{@solution[:sid]}"
          end

          ##
          # Fetch the CompositionHookInstance
          # @return [CompositionHookInstance] Fetched CompositionHookInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            CompositionHookInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the CompositionHookInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Update the CompositionHookInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to  100 characters long and it must be unique within
          #   the account.
          # @param [Boolean] enabled Whether the composition hook is active. When `true`,
          #   the composition hook will be triggered for every completed Group Room in the
          #   account. When `false`, the composition hook never triggers.
          # @param [Hash] video_layout A JSON object that describes the video layout of the
          #   composition hook in terms of regions. See {Specifying Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [String] audio_sources An array of track names from the same group room
          #   to merge into the compositions created by the composition hook. Can include zero
          #   or more track names. A composition triggered by the composition hook includes
          #   all audio sources specified in `audio_sources` except those specified in
          #   `audio_sources_excluded`. The track names in this parameter can include an
          #   asterisk as a wild card character, which matches zero or more characters in a
          #   track name. For example, `student*` includes tracks named `student` as well as
          #   `studentTeam`.
          # @param [String] audio_sources_excluded An array of track names to exclude. A
          #   composition triggered by the composition hook includes all audio sources
          #   specified in `audio_sources` except for those specified in
          #   `audio_sources_excluded`. The track names in this parameter can include an
          #   asterisk as a wild card character, which matches zero or more characters in a
          #   track name. For example, `student*` excludes `student` as well as `studentTeam`.
          #   This parameter can also be empty.
          # @param [Boolean] trim Whether to clip the intervals where there is no active
          #   media in the compositions triggered by the composition hook. The default is
          #   `true`. Compositions with `trim` enabled are shorter when the Room is created
          #   and no Participant joins for a while as well as if all the Participants leave
          #   the room and join later, because those gaps will be removed. See {Specifying
          #   Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [composition_hook.Format] format The container format of the media files
          #   used by the compositions created by the composition hook. Can be: `mp4` or
          #   `webm` and the default is `webm`. If `mp4` or `webm`, `audio_sources` must have
          #   one or more tracks and/or a `video_layout` element must contain a valid
          #   `video_sources` list, otherwise an error occurs.
          # @param [String] resolution A string that describes the columns (width) and rows
          #   (height) of the generated composed video in pixels. Defaults to `640x480`.
          #   The string's format is `{width}x{height}` where:
          #
          #   * 16 <= `{width}` <= 1280
          #   * 16 <= `{height}` <= 1280
          #   * `{width}` * `{height}` <= 921,600
          #
          #   Typical values are:
          #
          #   * HD = `1280x720`
          #   * PAL = `1024x576`
          #   * VGA = `640x480`
          #   * CIF = `320x240`
          #
          #   Note that the `resolution` imposes an aspect ratio to the resulting composition.
          #   When the original video tracks are constrained by the aspect ratio, they are
          #   scaled to fit. See {Specifying Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [String] status_callback The URL we should call using the
          #   `status_callback_method` to send status information to your application on every
          #   composition event. If not provided, status callback events will not be
          #   dispatched.
          # @param [String] status_callback_method The HTTP method we should use to call
          #   `status_callback`. Can be: `POST` or `GET` and the default is `POST`.
          # @return [CompositionHookInstance] Updated CompositionHookInstance
          def update(friendly_name: nil, enabled: :unset, video_layout: :unset, audio_sources: :unset, audio_sources_excluded: :unset, trim: :unset, format: :unset, resolution: :unset, status_callback: :unset, status_callback_method: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'Enabled' => enabled,
                'VideoLayout' => Twilio.serialize_object(video_layout),
                'AudioSources' => Twilio.serialize_list(audio_sources) { |e| e },
                'AudioSourcesExcluded' => Twilio.serialize_list(audio_sources_excluded) { |e| e },
                'Trim' => trim,
                'Format' => format,
                'Resolution' => resolution,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
            })

            payload = @version.update('POST', @uri, data: data)

            CompositionHookInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionHookContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionHookContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionHookInstance < InstanceResource
          ##
          # Initialize the CompositionHookInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the CompositionHook resource to fetch.
          # @return [CompositionHookInstance] CompositionHookInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'enabled' => payload['enabled'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'sid' => payload['sid'],
                'audio_sources' => payload['audio_sources'],
                'audio_sources_excluded' => payload['audio_sources_excluded'],
                'video_layout' => payload['video_layout'],
                'resolution' => payload['resolution'],
                'trim' => payload['trim'],
                'format' => payload['format'],
                'status_callback' => payload['status_callback'],
                'status_callback_method' => payload['status_callback_method'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CompositionHookContext] CompositionHookContext for this CompositionHookInstance
          def context
            unless @instance_context
              @instance_context = CompositionHookContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Boolean] Whether the CompositionHook is active
          def enabled
            @properties['enabled']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The array of track names to include in the compositions created by the composition hook
          def audio_sources
            @properties['audio_sources']
          end

          ##
          # @return [String] The array of track names to exclude from the compositions created by the composition hook
          def audio_sources_excluded
            @properties['audio_sources_excluded']
          end

          ##
          # @return [Hash] A JSON object that describes the video layout of the Composition
          def video_layout
            @properties['video_layout']
          end

          ##
          # @return [String] The dimensions of the video image in pixels expressed as columns (width) and rows (height)
          def resolution
            @properties['resolution']
          end

          ##
          # @return [Boolean] Whether intervals with no media are clipped
          def trim
            @properties['trim']
          end

          ##
          # @return [composition_hook.Format] The container format of the media files used by the compositions created by the composition hook
          def format
            @properties['format']
          end

          ##
          # @return [String] The URL to send status information to your application
          def status_callback
            @properties['status_callback']
          end

          ##
          # @return [String] The HTTP method we should use to call status_callback
          def status_callback_method
            @properties['status_callback_method']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # Fetch the CompositionHookInstance
          # @return [CompositionHookInstance] Fetched CompositionHookInstance
          def fetch
            context.fetch
          end

          ##
          # Delete the CompositionHookInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Update the CompositionHookInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to  100 characters long and it must be unique within
          #   the account.
          # @param [Boolean] enabled Whether the composition hook is active. When `true`,
          #   the composition hook will be triggered for every completed Group Room in the
          #   account. When `false`, the composition hook never triggers.
          # @param [Hash] video_layout A JSON object that describes the video layout of the
          #   composition hook in terms of regions. See {Specifying Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [String] audio_sources An array of track names from the same group room
          #   to merge into the compositions created by the composition hook. Can include zero
          #   or more track names. A composition triggered by the composition hook includes
          #   all audio sources specified in `audio_sources` except those specified in
          #   `audio_sources_excluded`. The track names in this parameter can include an
          #   asterisk as a wild card character, which matches zero or more characters in a
          #   track name. For example, `student*` includes tracks named `student` as well as
          #   `studentTeam`.
          # @param [String] audio_sources_excluded An array of track names to exclude. A
          #   composition triggered by the composition hook includes all audio sources
          #   specified in `audio_sources` except for those specified in
          #   `audio_sources_excluded`. The track names in this parameter can include an
          #   asterisk as a wild card character, which matches zero or more characters in a
          #   track name. For example, `student*` excludes `student` as well as `studentTeam`.
          #   This parameter can also be empty.
          # @param [Boolean] trim Whether to clip the intervals where there is no active
          #   media in the compositions triggered by the composition hook. The default is
          #   `true`. Compositions with `trim` enabled are shorter when the Room is created
          #   and no Participant joins for a while as well as if all the Participants leave
          #   the room and join later, because those gaps will be removed. See {Specifying
          #   Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [composition_hook.Format] format The container format of the media files
          #   used by the compositions created by the composition hook. Can be: `mp4` or
          #   `webm` and the default is `webm`. If `mp4` or `webm`, `audio_sources` must have
          #   one or more tracks and/or a `video_layout` element must contain a valid
          #   `video_sources` list, otherwise an error occurs.
          # @param [String] resolution A string that describes the columns (width) and rows
          #   (height) of the generated composed video in pixels. Defaults to `640x480`.
          #   The string's format is `{width}x{height}` where:
          #
          #   * 16 <= `{width}` <= 1280
          #   * 16 <= `{height}` <= 1280
          #   * `{width}` * `{height}` <= 921,600
          #
          #   Typical values are:
          #
          #   * HD = `1280x720`
          #   * PAL = `1024x576`
          #   * VGA = `640x480`
          #   * CIF = `320x240`
          #
          #   Note that the `resolution` imposes an aspect ratio to the resulting composition.
          #   When the original video tracks are constrained by the aspect ratio, they are
          #   scaled to fit. See {Specifying Video
          #   Layouts}[https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts]
          #   for more info.
          # @param [String] status_callback The URL we should call using the
          #   `status_callback_method` to send status information to your application on every
          #   composition event. If not provided, status callback events will not be
          #   dispatched.
          # @param [String] status_callback_method The HTTP method we should use to call
          #   `status_callback`. Can be: `POST` or `GET` and the default is `POST`.
          # @return [CompositionHookInstance] Updated CompositionHookInstance
          def update(friendly_name: nil, enabled: :unset, video_layout: :unset, audio_sources: :unset, audio_sources_excluded: :unset, trim: :unset, format: :unset, resolution: :unset, status_callback: :unset, status_callback_method: :unset)
            context.update(
                friendly_name: friendly_name,
                enabled: enabled,
                video_layout: video_layout,
                audio_sources: audio_sources,
                audio_sources_excluded: audio_sources_excluded,
                trim: trim,
                format: format,
                resolution: resolution,
                status_callback: status_callback,
                status_callback_method: status_callback_method,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionHookInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionHookInstance #{values}>"
          end
        end
      end
    end
  end
end