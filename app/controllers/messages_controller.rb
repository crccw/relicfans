class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /wxapi
  def create
    logger.debug "Msg received: #{request.raw_post}"

    coming_in = Hash.from_xml(request.raw_post)["xml"].map{ |k,v|
      {k.underscore => v}}.reduce(:merge);
    coming_in[:create_time] = Time.at coming_in[:create_time].to_i

    logger.debug "Msg parsed: #{coming_in.to_s}"

    @message = Message.new(coming_in)
    @message.save unless Message.count(msgid: @message.msg_id)>0

    render "msg_text", format: :xml
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:msg_id, :to_user_name, :from_user_name, 
                                      :create_time, :msg_type, :content)
    end
end
