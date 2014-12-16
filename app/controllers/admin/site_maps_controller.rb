class Admin::SiteMapsController < Admin::AdminController
  layout 'admin'

  def index
    @pages = [Page.home]
    @virtuals = Page.virtual
  end

  def update
    SiteMap.rebuild(params[:sitemap])
    head status: :ok
  end
end

