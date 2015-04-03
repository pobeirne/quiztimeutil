class Quiztimeutil

  require 'date'

  def initialize(user_id )
    @user_id = user_id
    @dt_arr = Array.new
  end

  def getDurationInMinutes(dt1 , dt2)
    total_seconds = ((dt2.to_datetime - dt1.to_datetime) * 24 * 60 * 60).to_i
    minutes = ((total_seconds % 3600) / 60).to_i
    time = total_seconds.divmod(60)
    return time[0].to_s+":"+time[1].to_s
  end

  def avg_of_times(array_of_time)
    @dt_arr = array_of_time
    size = array_of_time.size
    avg_minutes = array_of_time.map do |x|
      hour, minute = x.split(':')
      total_minutes = hour.to_i * 60 + minute.to_i
    end.inject(:+)/size
    return "%s:%s" % avg_minutes.divmod(60)
  end

end
