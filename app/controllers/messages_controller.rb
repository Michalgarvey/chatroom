class MessagesController < ApplicationController

  before_action :authenticate_user!
  # GET /messages
  # GET /messages.json

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to @room, notice: 'message was posted successfully.' }
        format.json { render :show, status: :created, location: @room }
        format.js
      else
        format.html { redirect_to @room, alert: 'There was an issue with your message.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end



  end



  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    room = @message.room
    @message.destroy
    redirect_to room
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.

end
