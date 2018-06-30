class Notice < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: {:message => "El titulo es requerido"}
  validates :body, presence: {:message => "El titulo es requerido"}
end
