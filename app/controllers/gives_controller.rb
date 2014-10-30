class GivesController < ApplicationController
  def campaigns
    @campaigns = Campaign.where(:authorized => true)

  end
  def create_campaign

    campaign = Campaign.new
    campaign.title = params[:title]
    campaign.site_url = params[:site_url]
    campaign.facebook_url = params[:facebook_url]
    campaign.category = params[:category]
    campaign.phone = params[:phone]
    campaign.email = params[:email]
    campaign.content = params[:content]
    if current_user.email == "minyoung9353@nate.com" || current_user.email == "bigtory.kim@gmail.com"

      campaign.authorized = true
    else
      campaign.authorized = false
    end
    campaign.save
    campaign.update(campaign_params)
    redirect_to :action => "campaigns"

  end


  private


def campaign_params
    params.require(:campaign).permit(:logo)
end

end
