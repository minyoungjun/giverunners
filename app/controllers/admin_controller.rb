class AdminController < ApplicationController

  before_filter :is_login
  before_filter :is_admin

def campaigns

end

  def delete
    campaign = Campaign.find(params[:id])
    campaign.authorized = false
    campaign.save
  end
  def authorize
    campaign = Campaign.find(params[:id])
    campaign.authorized = true
    campaign.save
  end
  def update
    @campaign = Campaign.find(params[:id])

  end
  def update_campaign

    campaign = Campaign.find(params[:id])
    campaign.title = params[:title]
    campaign.site_url = params[:site_url]
    campaign.facebook_url = params[:facebook_url]
    campaign.category = params[:category]
    campaign.content = params[:content]
    campaign.save

    if params["campaign[logo]"] != nil
      campaign.logo.destroy
      campaign.logo.clear
      campaign.update(campaign_params)
    end
    redirect_to :action => "campaigns"
  end


  private


  def campaign_params
    params.require(:campaign).permit(:logo)
  end


end
