require 'mailgun'
class HomeController < ApplicationController
    def index
    end
    def write
        @eye = params[:email]
        @youjacha = params[:title]
        @coffee =params[:content]
         redirect_to "/list"
     new_post=Post.new
     new_post.title=@youjacha
     new_post.content=@coffee
     new_post.save
     
        mg_client = Mailgun::Client.new("key-66042b03dd370c3aa2b61fb2a251df1d")

        message_params =  {
                   from: 'hello@gmail.com',
                   to:  @eye,
                   subject: @youjacha,
                   text: @coffee
                  }

        result = mg_client.send_message('sandboxa2f52456ef2b48d7bce2db91d2ed5e95.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
    end
    def list
         @every_post =Post.all.order("id desc")
    end
    def destroy
    @one_post=Post.find(
    params[:post_id]
    )
    @one_post.destroy
    redirect_to "/list"
  end
  def update_view
      @one_post=Post.find (params[:post_id])
  end
  def silgae
    @one_post=Post.find(params[:post_id])
    @one_post.title= params[:title]
    @one_post.content= params[:content]
    @one_post.save
    redirect_to "/list"
  end
    end
