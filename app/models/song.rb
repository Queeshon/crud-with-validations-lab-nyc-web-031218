class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false], message: 'Released must be either true or false.' }
  validates :release_year, presence: true, if: :yes_release
  validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }, if: :yes_release
  validates :artist_name, presence: true

  def no_release
    self.released == false
  end

  def yes_release
    self.released == true
  end

end
