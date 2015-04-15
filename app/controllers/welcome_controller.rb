class WelcomeController < ApplicationController
	before_filter :authenticate_user, :except=>['index','search']
	def index
		@products=Product.all
	end
	def userinfo
	end
	def search
		query_str=params.permit(:content)[:content].split(" ").join
		@products=Tag.where(:title=>query_str).map{|tag| tag.products}.flatten
	end
end
