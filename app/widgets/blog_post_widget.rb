class BlogPostWidget < Apotomo::Widget
include Databasedotcom::Rails::Controller

responds_to_event :submit, :with => :create_blog_post

  def display
  	@blog_posts = Blog_Post__c.all
    render
  end

  def create_blog_post(evt)

  	Blog_Post__c.new(:Name => evt[:text], :OwnerId => evt[:ownerid]).save
	
	@blog_posts = Blog_Post__c.all
	replace :view => :display
  end


end
