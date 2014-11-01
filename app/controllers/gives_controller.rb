class GivesController < ApplicationController

  before_filter :is_login, :except => [:campaigns]

  def following
    fundraiser = Fundraiser.new
    fundraiser.user_id = current_user.id
    fundraiser.campaign_id = params[:campaign]
    fundraiser.pledge = params[:pledge]
    fundraiser.save
    redirect_to :action => "campaigns"
  end

  def follow
    @campaign = Campaign.find(params[:id])
  end
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
