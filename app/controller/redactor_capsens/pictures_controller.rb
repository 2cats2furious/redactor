class RedactorCapsens::PicturesController < ApplicationController
  before_filter :redactor_authenticate_user!

  def index
    @pictures = RedactorCapsens.picture_model.where(
        RedactorCapsens.picture_model.new.respond_to?(RedactorCapsens.devise_user) ? { RedactorCapsens.devise_user_key => redactor_current_user.id } : { })
    render :json => @pictures.to_json
  end

  def create
    @picture = RedactorCapsens.picture_model.new

    file = params[:file]
    @picture.data = RedactorCapsens::Http.normalize_param(file, request)
    if @picture.has_attribute?(:"#{RedactorCapsens.devise_user_key}")
      @picture.send("#{RedactorCapsens.devise_user}=", redactor_current_user)
      @picture.assetable = redactor_current_user
    end

    if @picture.save
      render json: { filelink: @picture.url(:content) }
    else
      render json: { error: @picture.errors }
    end
  end

  private

  def redactor_authenticate_user!
    if RedactorCapsens.picture_model.new.has_attribute?(RedactorCapsens.devise_user)
      super
    end
  end
end
