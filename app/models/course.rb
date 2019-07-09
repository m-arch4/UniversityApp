class Course < ApplicationRecord
has_many :students

validates :title, presence: true,
   length: { minimum: 4, maximum: 12 },
   uniqueness: { case_sensitive: false }

   validates :description, presence: true,
      length: { minimum: 10, maximum: 300 },
      uniqueness: { case_sensitive: false }

end
