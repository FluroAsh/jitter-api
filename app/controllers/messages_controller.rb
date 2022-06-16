class MessagesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :check_ownership, only: [:update, :destroy]
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    # @messages = Message.order("updated_at DESC")

    # can't call transform_message on @messages object as it is an array...
    # render json: @messages

    # -> Solution Below:
    @messages = []

    # order by desc then iterate over the array
    Message.order("updated_at DESC").each do |message|
      @messages << message.transform_message
    end

    render json: @messages
  end

  # GET /messages/1
  def show
    # invoke the model function 'transform_message' which returns a reformatted object
    render json: @message.transform_message
  end

  # POST /messages
  def create
    # @message = Message.new(message_params)
    @message = current_user.messages.create(message_params)

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    def check_ownership
      if @current_user.id != @message.user.id
        render json: {error: "Unauthorised to do this action"}, status: 404
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      begin
        @message = Message.find(params[:id])
      rescue
        render json: {error: "No message found"}, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.permit(:text)
    end
  end