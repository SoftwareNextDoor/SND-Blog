class BlogPostsController < ApplicationController
	include Databasedotcom::Rails::Controller

  def index
  	@blog_posts = Blog_Post__c.all
  end

  def new
  end

  def create
  end

  def show
  end

end
