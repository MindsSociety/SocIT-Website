require 'json'
require 'mailchimp'
require 'mailchimp/errors'

module NewsletterHelper
  class MailchimpWrapper
    attr_accessor :mailchimp

    def initialize
      @mailchimp = Mailchimp::API.new Rails.application.secrets.mailchimp_api_key
    end

    def get_campaign_html(campaign_id)
      @mailchimp.campaigns.content(campaign_id)['html']
    end

    # Returns an array of emails sent
    # Emails are stored in a hash
    def get_campaign_list
      filters = {status: 'sent'}
      @mailchimp.campaigns.list(filters)['data']
    end
  end

  # Fakechimp is used when a valid Mailchimp API Key can not be found
  class FakechimpWrapper
    def get_campaign_html(campaign_id)
      File.read 'data/fake-data/mailchimp-campaigns-BigUpdate-content.html'
    end

    # Returns an array of emails sent
    # Emails are stored in a hash
    def get_campaign_list
      fake_data = JSON.parse(File.read 'data/fake-data/mailchimp-campaigns.json')
      fake_data['data']
    end
  end
end
