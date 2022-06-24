class UsersController < ApplicationController
    def index
      @users = User.all
      render json: @users
    end

    def create
        @user = User.new(user_params) # new because we need to edit the object before being created in the db
        @user.is_admin = false # can set this in the migration

        if @user.save
            pp user_params
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {username: @user.username, jwt: auth_token.token }, status: :created #, location: @message
        else
            # render json: @user.errors, status: :unprocessable_entity
            pp @user.errors
            render json: {error: @user.errors}
        end
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {username: @user.username, jwt: auth_token.token }, status: 200
        else
            render json: {error: "Invalid email or password"}
        end
    end

    private
     # Only allow a list of trusted parameters through.
        def user_params
            params.permit(:username, :email, :password, :password_confirmation )
        end
end
