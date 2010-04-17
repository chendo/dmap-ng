require 'dmap'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DMAP::Parser do
  describe "#initialize" do
    it "parses a simple DMAP" do
      DMAP.parse("ceWM\000\000\000\003sup").should == DMAP.build do
        ceWM 'sup'
      end
    end
    
    it "parses a nested DMAP" do
      DMAP.parse("msml\000\000\0000msma\000\000\000\b\000\000\314W\272\302\036\000msma\000\000\000\b\000\000\307sP\363\037\000").should == DMAP.build do
        msml do
          msma 224677167504896
          msma 219298093276928
        end
      end
    end
    
    describe "new tags" do
      it "parses cgmt" do
        DMAP.parse("cmgt\000\000\000\030mstt\000\000\000\004\000\000\000\310cmvo\000\000\000\004\000\000\000X"
        ).should == DMAP.build do
          cmgt do
            mstt 200 # Status
            cmvo 88 # Volume
          end
        end
      end
      
      it "parses caci" do
        DMAP.parse("caci\000\000\000[mstt\000\000\000\004\000\000\000\310muty\000\000\000\001\000mtco\000\000\000\004\000\000\000\001mrco\000\000\000\004\000\000\000\001mlcl\000\000\000&mlit\000\000\000\036miid\000\000\000\004\000\000\000\001cmik\000\000\000\001\001cmsp\000\000\000\001\001").should == DMAP.build do
          caci do # Some container
            mstt 200 # Status
            muty 0 # Update type
            mtco 1 # Total count
            mrco 1 # Return count
            mlcl do # Container
              mlit do # Container item
                miid 1 # ID
                cmik 1 # ??
                cmsp 1 # ??
              end
            end
          end
        end
      end
    end
  end
end