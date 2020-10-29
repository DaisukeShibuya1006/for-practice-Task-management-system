class Task < ApplicationRecord
    validates :title, presence: true, length: {maximum:20}
    validates :text, length: {maximum:50}
    
    enum status: {
        yet: 0,
        doing: 1,
        complete: 2
    }
    
    enum priority: {
        High: 0,
        middle: 1,
        low: 2
    }
end
