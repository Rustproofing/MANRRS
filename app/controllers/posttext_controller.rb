puts "ZZZZZZZZ: PosttextController"

class PosttextController < ApplicationController
	def posttext
		print "ZZZZZZZZ: post ",params["textmsg"],'\n'
		if params["textmsg"]
			if params["textmsg"].length>160
				redirect_to '/posttext/?failed=1'
				return 
			end
			File.open('/tmp/textmsg','w'){ |file|
				file.write(params["textmsg"])
			}
			system("/MANRRS/send_text.py /tmp/textmsg")
			redirect_to '/posttext'
		end
	end
end