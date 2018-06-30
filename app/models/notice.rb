class Notice < ApplicationRecord
  belongs_to :user
  validates :title, presence: {:message => "El titulo es requerido"}
  validates :body, presence: {:message => "El titulo es requerido"}
end
