class NewsletterController < ApplicationController
  attr_accessor :mailchimp, :campaign_list

  def initialize
    begin
      @mailchimp = NewsletterHelper::MailchimpWrapper.new
    rescue Mailchimp::Error => e
      Rails.logger.error e.message
      @mailchimp = NewsletterHelper::FakechimpWrapper.new
    end

    super
  end

  def index
    @campaign_list = @mailchimp.get_campaign_list
  end

  def get_campaign
    @campaign_list    = @mailchimp.get_campaign_list
    @campaign_content = @mailchimp.get_campaign_html  params[:campaign_id]
    @campaign_title   = @mailchimp.get_campaign_title params[:campaign_id]
  end
end
