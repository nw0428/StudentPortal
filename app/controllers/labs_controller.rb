class LabsController < ApplicationController


	def new
	end

	def destroy
	end

	def edit
	end

	def create
		@lab = Lab.new(params[:lab])

		@lab.save
		redirect_to @lab
	end

	def show
		@lab = Lab.find(params[:id])
		require 'open-uri'

		sit = @lab.link
		web_cont = open(sit).read
		x = 0
		while (x = web_cont.index("<a", x))
			puts "found"
			x = web_cont.index(">", x)
			web_cont = web_cont.insert(x, "target=\"_blank\"")
		end
		@content = web_cont
	end

	def index
		@labs = Lab.all
	end

end
