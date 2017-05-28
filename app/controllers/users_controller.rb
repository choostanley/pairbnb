class UsersController < Clearance::UsersController
	def new
		@user = User.new  # = user_from_params
		# render template: "users/new"
	end

	def create
		byebug
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_back_or url_after_create
		else
			respond_to do |format|
				format.html {render template: "user/new"}
				format.js 
			end
			# render template: "user/new"
		end
	end

	def index 
		render 'homepage/index'
	end	

	private
	def user_params
		params.require(:user).permit(:name, :age, :email, :password)
	end
end