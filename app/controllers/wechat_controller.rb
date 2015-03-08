class WechatController < ApplicationController
  before_filter :valid?

  def valid?
    signature = [RF_CONFIG["wechat"]["token"],
                 params[:timestamp], params[:nonce]].sort
    raise WechatError::NotValid unless
        params[:signature] == Digest::SHA1.hexdigest(signature.join)
  end

  def init
    render plain: params[:echostr]
  end
  
end
