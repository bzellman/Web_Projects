class Timer  
    attr_accessor :seconds
    def initialize
        @seconds = 0;
    end
    
    def time_string
        hours = @seconds / 3600;
        remaining = @seconds % 3600;
        minutes = remaining / 60;
        @seconds = remaining % 60;
        time_string = padded(hours)+":"+padded(minutes)+":"+padded(@seconds);
        # puts timer_string;
        return time_string;        
    end   

    def padded(number)
        string = number.to_s
        if (number < 10)
            string = '0' + string
        end
    return string;
    end
end