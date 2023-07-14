class Book < ApplicationRecord
  belongs_to :library

  def checked_out?
    if status == 'checked_out' && user_id.present?
      true
    else
      false
    end
  end
end
