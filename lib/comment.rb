class Comment
  attr_reader :id, :comment, :diary_id

  def initialize(id: id, comment: comment, diary_id: diary_id)
    @id = id
    @comment = comment
    @diary_id = diary_id
  end
  
end