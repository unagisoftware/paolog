module Paolog
  class LogReader
    NUMBER_OF_LINES = 100

    def read(limit)
      limit = [limit, NUMBER_OF_LINES].max
      amount = [limit, num_lines].min

      readlines(amount)
    end

    private

    def remaining_lines(offset)
      offset == -1 ? num_lines : (num_lines - offset)
    end

    def log_path
      Rails.root.join("log/#{Rails.env}.log")
    end

    def num_lines
      `wc -l #{log_path}`.split.first.to_i
    end

    def readlines(amount)
      `tail -n #{amount} #{log_path}`.split(/\n/)
    end
  end
end
