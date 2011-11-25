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


class Admin::BlogPostsController < Admin::BaseController
  include Databasedotcom::Rails::Controller

  has_widgets do |root|
    root << widget(:blog_post)
  end

  def index
  end
 end
