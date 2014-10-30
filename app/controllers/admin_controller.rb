class AdminController < ApplicationController

def campaigns

  if current_user.email != "minyoung9353@nate.com" && current_user.email != "bigtory.kim@gmail.com"

    redirect_to "/users/auth/facebook"

  end
end
def delete
  if current_user.email == "minyoung9353@nate.com" || current_user.email == "bigtory.kim@gmail.com"
    campaign = Campaign.find(params[:id])
    campaign.authorized = false
    campaign.save
  end
    redirect_to :back

end
def authorize

  if current_user.email == "minyoung9353@nate.com" || current_user.email == "bigtory.kim@gmail.com"
    campaign = Campaign.find(params[:id])
    campaign.authorized = true
    campaign.save
  end
    redirect_to :back
end

=begin
  def create_campaign
    campaign = Campaign.new
    campaign.title = params[:title]
    campaign.site_url = params[:site_url]
    campaign.facebook_url = params[:facebook_url]
    campaign.category = params[:category]
    campaign.content = params[:content]

    campaign.authorized = true
    campaign.save
    campaign.update(campaign_params)
    redirect_to :action => "campaigns"
  end
=end


  private


def campaign_params
    params.require(:campaign).permit(:logo)
end


end
