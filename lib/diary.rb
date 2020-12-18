require_relative './database_connection'
require_relative './comment'

class Diary
  attr_reader :id, :title, :entry, :comments

  def initialize(id:, title:, entry:)
    @id = id
    @title = title
    @entry = entry
  end

  def self.add(title:, entry:)
    result = DatabaseConnection.query("INSERT INTO diary(title, entry) VALUES ('#{title}', '#{entry}') RETURNING id, title, entry;")
    Diary.new(id: result[0]['id'], title: result[0]['title'], entry: result[0]['entry'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM diary")
    result.map { |item| Diary.new(id: item['id'], title: item['title'], entry: item['entry'])}
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM diary WHERE id=#{id}") 
    Diary.new(id: result[0]['id'], title: result[0]['title'], entry:result[0]['entry'])
  end

  def self.edit(id: , title: , entry: )
    result = DatabaseConnection.query("UPDATE diary SET title='#{title}', entry='#{entry}' WHERE id=#{id} RETURNING id, title, entry;")
    Diary.new(id: result[0]['id'], title: result[0]['title'], entry: result[0]['entry'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM diary WHERE id=#{id}")
  end

  def comments(diary_id: )
    result = DatabaseConnection.query("SELECT * FROM comments where diary_id=#{diary_id}")
    result.map{ |comment| Comment.new(id: comment['id'], comment: comment['comment'], diary_id: comment['diary_id'])}
  end

  def self.add_comments(diary_id: , comment: )
    result = DatabaseConnection.query("INSERT INTO comments(diary_id, comment) VALUES('#{diary_id}', '#{comment}') RETURNING id, comment, diary_id")
    Comment.new(id: result[0]['id'], comment: result[0]['comment'], diary_id:result[0]['diary_id'])
  end

end