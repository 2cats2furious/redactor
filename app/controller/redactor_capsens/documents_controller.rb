class RedactorCapsens::DocumentsController < ApplicationController
  before_filter :redactor_authenticate_user!

  def index
    @documents = RedactorCapsens.document_model.where(
        RedactorCapsens.document_model.new.respond_to?(RedactorCapsens.devise_user) ? { RedactorCapsens.devise_user_key => redactor_current_user.id } : { })
    render :json => @documents.to_json
  end

  def create
    @document = RedactorCapsens.document_model.new

    file = params[:file]
    @document.data = RedactorCapsens::Http.normalize_param(file, request)
    if @document.has_attribute?(:"#{RedactorCapsens.devise_user_key}")
      @document.send("#{RedactorCapsens.devise_user}=", redactor_current_user)
      @document.assetable = redactor_current_user
    end

    if @document.save
      render json: { filelink: @document.url, filename: @document.filename }
    else
      render json: { error: @document.errors }
    end
  end

  private

  def redactor_authenticate_user!
    if RedactorCapsens.document_model.new.has_attribute?(RedactorCapsens.devise_user)
      super
    end
  end
end
