require "big"

module ObjectId
  MID = macaddr[6,6]
  PID = (Process.pid | 0x1000).to_s(16)
  COUNTER = Atomic.new Random.new.next_int.abs

  def self.new(base=36, timestamp=Time.now.to_unix)
    counter = (COUNTER.add(1).abs | 0x40000000).to_s(16)[2,6]
    BigInt.new("#{timestamp.to_s(16)}#{MID}#{PID}#{counter}", 16).to_s base
  end

  def self.macaddr
    dir = "/sys/class/net"
    if File.exists?(dir)
      devs = Dir.open(dir).children
      if devs.size > 0
        return File.open(File.join(dir, devs.sort.first, "address")).read_line.strip.gsub(":", "")
      end
    end
    12.times.map { (rand * 16).to_i8.to_s(16) }.join
  end
end
