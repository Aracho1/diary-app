require_relative './database_connection'

class Diary
  attr_reader :id, :title, :entry

  def initialize(id:, title:, entry:)
    @id = id
    @title = title
    @entry = entry
  end

  # def self.instance
  #   @diary ||= Diary.new
  # end

  def add(title:, entry:)
    result = DatabaseConnection.query("INSERT INTO diary(title, entry) VALUES ('#{title}', '#{entry}') RETURNING id, title, entry;")
    Diary.new(id: result[0]['id'], title: result[0]['title'], entry: result[0]['entry'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM diary")
    result.map { |item| Diary.new(id: item['id'], title: item['title'], entry: item['entry'])}
  end

  def find_title(title)
    result = DatabaseConnection.query("SELECT title FROM diary WHERE title='#{title}';")
    result[0]['title']
  end
  
  def find_entry(title)
    result = DatabaseConnection.query("SELECT entry FROM diary WHERE title='#{title}';")
    result[0]['entry']
  end

  def edit
  end
end