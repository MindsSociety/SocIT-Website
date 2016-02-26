class NewsletterController < ApplicationController
  attr_accessor :mailchimp, :campaign_list

  def initialize
    begin
      @mailchimp = NewsletterHelper::MailchimpHelper.new
    rescue Mailchimp::Error => e
      Rails.logger.error e.message
      @mailchimp = NewsletterHelper::FakechimpHelper.new
    end

    super
  end

  def index
    @campaign_list = @mailchimp.get_campaign_list
  end

  def get_campaign
    # get params[:campaign_id]
  end
end
