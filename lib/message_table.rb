class MessagesTable
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def all
    insert_user_sql = <<-SQL
    SELECT * FROM messages
    SQL

    @database_connection.sql(insert_user_sql)
  end

  def create(name,message)
    insert_user_sql = <<-SQL
    INSERT into messages (name, message)
    VALUES ('#{name}','#{message}')
      RETURNING 'id'
    SQL
    @database_connection.sql(insert_user_sql).first
  end

  def delete(message)
    find_sql = <<-SQL
    DELETE FROM messages
    WHERE message = '#{message}'
    SQL
    @database_connection.sql(find_sql)
  end
end