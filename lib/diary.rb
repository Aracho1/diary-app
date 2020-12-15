require_relative './database_connection'

class Diary

  def self.instance
    @diary ||= Diary.new
  end

  def add(title, entry)
    result = DatabaseConnection.query("INSERT INTO diary(title, entry) VALUES ('#{title}', '#{entry}');")
  end

  def self.titles
    result = DatabaseConnection.query("SELECT title FROM diary")
    result.map { |item| item['title']}
  end

  def find_entry(title)
    result = DatabaseConnection.query("SELECT entry FROM diary WHERE title='#{title}';")
    result[0]['entry']
  end
end