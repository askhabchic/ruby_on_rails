require 'sqlite3'

class FtQueryController < ApplicationController
  def index
   
  end

  def create_db
    $db = SQLite3::Database.new("db/ft_sql.db")
    redirect_to '/'
  end

  def create_table
    $db.execute('CREATE TABLE IF NOT EXISTS clock_watch(
                    ts_id INTEGER PRIMARY KEY,
                    day INTEGER,
                    month INTEGER,
                    year INTEGER,
                    hour INTEGER,
                    min INTEGER,
                    sec INTEGER,
                    race INTEGER,
                    name VARCHAR(50),
                    lap INTEGER);')
    $db.execute ('CREATE TABLE IF NOT EXISTS race(
                    r_id INTEGER PRIMARY KEY,
                    start VARCHAR(50));')
    redirect_to '/'
  end

  def drop_table
    $db.execute('DROP TABLE IF EXISTS clock_watch;')
    $db.execute('DROP TABLE IF EXISTS race;')
    redirect_to '/'
  end

  def start_race
   
  end

  def insert_time_stamp
  
  end

  def delete_last

  end

  def destroy_all
   
  end

  def all_by_name
 
  end

  def all_by_race
   
  end

  def update_time_stamp
  
  end

  private


end
