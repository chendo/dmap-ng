require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "to_dsl" do
  it "returns a DSL string" do
    DMAP.build do
      cmgt do
        mstt 200 # Status
        cmvo 88 # Volume
      end
    end.to_dsl.should == <<-STR.gsub(/^    /, '').strip
    cmgt do
      mstt 200
      cmvo 88
    end
    STR
  end
end