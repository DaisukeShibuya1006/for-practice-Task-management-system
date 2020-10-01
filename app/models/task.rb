class Task < ApplicationRecord
    validates :title, presence: true, length: {maximum:20}
    validates :text, length: {maximum:50}
end
