
def check_wifi_connection
  %x[ping -c 1 google.com] =~ /1 packets received/i 
end

def restart_airport_utility
  %x[networksetup -setairportpower en1 off]
  %x[networksetup -setairportpower en1 on]
end


ping_failure  = 0
threshold     = 60

loop do

  if check_wifi_connection
    ping_failure  = 0

  elsif ping_failure > threshold
    puts "start to sleep with ping_failure: #{ping_failure} and threshold: #{threshold}"
    
    %x[say -v "Cellos" "internet gitti hagi restart ediyom."]
    restart_airport_utility
    ping_failure  = 0
    
    puts "ended to sleep with ping_failure: #{ping_failure} and threshold: #{threshold}"

  else
    ping_failure += 1

  end

  sleep threshold
end
