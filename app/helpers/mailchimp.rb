module MailChimpHelper
  require 'net/http'
  require 'uri'

  @mailchimp_api = "http://us2.api.mailchimp.com/3.0/"
  @mailchimp_uri = URI.parse("http://us2.api.mailchimp.com/3.0/")

  @params = { header: 'content-type: application/json',
              user: "minds:#{Rails.application.secrets.mailchimp_api_key}"}

  def MailChimpHelper.get_campaign_list
    return self.get_request("#{@mailchimp_api}campaigns/")
  end

  def MailChimpHelper.get_campaign(id)
    return self.get_request(@mailchimp_api + "campaigns/#{id}")
  end

  private

  def MailChimpHelper.get_request(request_url)
    uri = URI(request_url)
    uri.query = URI.encode_www_form(@params)

    return net::HTTP.get_response(uri)
  end
end
