require "big"

class ObjectId
  DEV_DIR = "/sys/class/net"
  MAC_ADDR = File.open(File.join(DEV_DIR, Dir.open(DEV_DIR).children.first, "address")).read_line.strip.gsub(":", "")
  PID = (Process.pid | 0x1000).to_s(16)
  COUNTER = Atomic.new Random.new.next_int.abs

  def self.new(timestamp=Time.now.epoch, base=36)
    counter = (COUNTER.add(1).abs | 0x10000000).to_s(16)[2,6]
    BigInt.new("#{timestamp.to_s(16)}#{MAC_ADDR[6,6]}#{PID}#{counter}", 16).to_s base
  end
end
