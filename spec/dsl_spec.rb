require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DSLs" do
  describe "#to_dsl" do
    it "returns a DSL string" do
      DMAP.build do
        cmgt do
          mstt 200 # Status
          cmvo 88 # Volume
        end
      end.to_dsl.should == <<-STR.gsub(/^      /, '').strip
      cmgt do # unknown.list
        mstt 200 # dmap.status
        cmvo 88 # dmcp.volume
      end
      STR
    end
  end

  describe ".build" do
    it "must be able to handle empty list tags" do
      lambda { 
        DMAP.build do
          mlcl do
          end
        end
      }.should_not raise_error
    end
    
    it "builds a valid /databases aply tag" do
      DMAP.build do
        aply do
          mstt 200 # Status
          muty 0 # Update type
          mtco 2 # Total count
          mrco 2 # Return count
          mlcl do # Container
            mlit do # Container item
              miid 10310 # Item ID
              mper 123 # Persistent ID
              minm 'Music' # Container name
              aeSP true # Smart playlist
              mpco 0 # Parent ID, so therefore parent container
              aePS 6 # Special playlist type/ID
              meds 0 # Edit commands supported
              mimc 2 # Item/Song count
            end
            mlit do # Container item
              miid 10281
              mper 1234
              minm 'iTunes DJ'
              mpco 0 # Parent ID
              aePS 2 # Spcial playlist type/ID
              meds 0 # Edit commands supported
              ceJI 0x282c # Current jukebox song ID?
              mimc 18 # Item/song count
            end
          end
        end
      end
    end
    
    it "builds a valid caci tag" do
      DMAP.build do
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
      end.to_dmap
    end
  end
  

end