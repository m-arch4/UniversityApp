class Student < ApplicationRecord

belongs_to :course

  validates :username, presence: true,
     length: { minimum: 4, maximum: 12 },
     uniqueness: { case_sensitive: false }

  validates :name, presence: true,
   length: { minimum: 4, maximum: 12 },
   uniqueness: { case_sensitive: false }
   
  validates :course_id, presence: true

has_secure_password

end
