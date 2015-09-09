require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance::StatisticsList do
  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "cumulative": {
        "activity_durations": [
         {
          "avg": 0.0,
          "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Busy",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Idle",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Offline",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Reserved",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         }
        ],
        "end_time": "2015-08-18T16:36:19Z",
        "reservations_accepted": 0,
        "reservations_canceled": 0,
        "reservations_created": 0,
        "reservations_rejected": 0,
        "reservations_rescinded": 0,
        "reservations_timed_out": 0,
        "start_time": "2015-08-18T16:21:19Z",
        "tasks_assigned": 0
       },
       "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').statistics.get('', {EndDate: Date.new(2008, 1, 2), Minutes: 1, StartDate: Date.new(2008, 1, 2)})
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "cumulative": {
        "activity_durations": [
         {
          "avg": 0.0,
          "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Busy",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Idle",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Offline",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Reserved",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         }
        ],
        "end_time": "2015-08-18T16:36:19Z",
        "reservations_accepted": 0,
        "reservations_canceled": 0,
        "reservations_created": 0,
        "reservations_rejected": 0,
        "reservations_rescinded": 0,
        "reservations_timed_out": 0,
        "start_time": "2015-08-18T16:21:19Z",
        "tasks_assigned": 0
       },
       "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').statistics.get('', {EndDate: Date.new(2008, 1, 2), Minutes: 1, StartDate: Date.new(2008, 1, 2)})
      expect { resource.sid }.not_to raise_error
    end
  end
end