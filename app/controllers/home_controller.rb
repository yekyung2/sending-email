class HomeController < ApplicationController
    def index
    end
    def write
        @eye = params[:title]
        @nose = params[:content]
    end

end
