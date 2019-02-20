require "./spec_helper"

describe ObjectId do
  it "works" do
    id : String = ObjectId.new

    id.size.should eq 19

    ObjectId.new(16).size.should eq 24

    timestamp = Time.new(2016, 2, 15, 10, 20, 30).to_unix
    id = ObjectId.new(16, timestamp)
    id[0,8].to_i(16).should eq timestamp

    ObjectId.new.should be < ObjectId.new
  end

  it "check" do
    ids = Array(String).new
    99999.times { |i|
      timestamp = Time.now.to_unix
      id = ObjectId.new 36, timestamp
      id.size.should eq 19
      id16 = BigInt.new(id, 36).to_s(16)
      id16.size.should eq 24
      id16[0,8].to_i(16).should eq timestamp
      id.should be > ids[i - 1] if i > 0
      ids << id
    }
    ids.uniq.size.should eq 99999
  end
end
