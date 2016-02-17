class NewsletterController < ApplicationController
  def index
    render text: "test"
  end

  def get_campaign
    # get params[:campaign_id]
  end
end
