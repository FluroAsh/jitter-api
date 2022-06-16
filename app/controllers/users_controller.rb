class UsersController < ApplicationController
  def create 
    @user = User.create(user_params)
    
    if @user.errors.any?
      render json: @user.errors, status: 400
    else
      # generate object as Knock AuthToken which contains our user ID in the payload
      auth_token = Knock::AuthToken.new payload: {sub: @user.id} 
      # auth_token.token is the token property in the auth_token object
      render json: {username: @user.username, jwt: auth_token.token}, status: 201
    end
  end

  def login
    # on form submit we check to see if email exists AND if password is valid
    # by using our params object
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # create token 
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {username: @user.name, jwt: auth_token.token}, status: 200
    else
      render json: {error: "Invalid email or password"}, status: 404
    end
  end

  private
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
end
