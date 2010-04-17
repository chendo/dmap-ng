require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Selectors" do
  subject do
    @expected = DMAP.build do
      caci do # Some container
        mstt 200 # Status
        muty 0 # Update type
        mtco 1 # Total count
        mrco 1 # Return count
        ceWM 'some string'
        mlcl do # Container
          mlit do # Container item
            miid 1 # ID
            cmik 1 # ??
            cmsp 1 # ??
          end
          mlit do # Container item
            miid 2 # ID
            cmik 1 # ??
            cmsp 1 # ??
          end
        end
      end
    end
  end
  
  it "selects individual tags" do
    subject.mstt.should == 200
    subject.ceWM.should == 'some string'
  end
  
  it "selects array tags" do
    subject.mlcl.should == DMAP.build do
      mlit do # Container item
        miid 1 # ID
        cmik 1 # ??
        cmsp 1 # ??
      end
      mlit do # Container item
        miid 2 # ID
        cmik 1 # ??
        cmsp 1 # ??
      end
    end
  end
  
  it "selects array elements" do
    subject.mlcl[0].should == DMAP.build do
      mlit do # Container item
        miid 1 # ID
        cmik 1 # ??
        cmsp 1 # ??
      end
    end
  end
end