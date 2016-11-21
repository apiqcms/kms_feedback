Kms::UsersController.class_eval do
  protect_from_forgery except: :alertable
  def alertable
    Kms::User.update_all(alert: false)
    params[:users_ids].each do |id|
      user = Kms::User.find_by_id(id.to_i)
      user.update_attribute(:alert, true) if user
    end if params[:users_ids]
    head :ok
  end
end
