#SalesForce API
#<Blog_Post__c:0x00000102d64630
  #@Id="a00U0000001jpgAIAQ",
  #@OwnerId="005U0000000dn0hIAA",
  #@IsDeleted=false,
  #@Name="Hello World 3",
  #@CreatedDate=Sat, 19 Nov 2011 20:42:08 +0000,
  #@CreatedById="005U0000000dn0hIAA",
  #@LastModifiedDate=Sat, 19 Nov 2011 20:42:08 +0000,
  #@LastModifiedById="005U0000000dn0hIAA",
  #@SystemModstamp=Sat, 19 Nov 2011 20:42:08 +0000,
  #@LastActivityDate=nil,
  #@Body__c="testing",
  #@Status__c="Published",
  #@Type__c="Text">]

class BlogPostsController < ApplicationController
  include Databasedotcom::Rails::Controller

 # client = Databasedotcom::Client.new
 # client.authenticate :token => "my-oauth-token", :instance_url => "https://na12.salesforce.com"  #=> "my-oauth-token"

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
