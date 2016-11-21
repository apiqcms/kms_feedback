Kms::User.class_eval do
  scope :alertable, -> { where('alert') }
end
