class BlogPostsController < ApplicationController
	include Databasedotcom::Rails::Controller

  def index
  	debugger
  	@blogposts = Blog_Post__c.all
  end

  def new
  end

  def create
  end

  def show
  end

end
