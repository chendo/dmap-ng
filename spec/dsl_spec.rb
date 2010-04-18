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
    
    it "handles the special case for ceJV" do
      # ceJV is a 4 byte integer field but seems to store the value as a short in the first two bytes
      DMAP.build do
        mlit do # dmap.listingitem
          mikd 2 # dmap.itemkind
          asal "Aquarium" # daap.songalbum
          asar "Naomi" # daap.songartist
          miid 3123 # dmap.itemid
          minm "Relax She Said" # dmap.itemname
          mper 9013529250002063060 # dmap.persistentid
          mcti 10386 # dmap.containeritemid
          aeHV 0 # com.apple.itunes.has-video
          asai 9013529250002063588 # daap.songalbumid
          ceJV 2 # com.apple.itunes.jukebox-vote
          ceJC 1 # com.apple.itunes.jukebox-client-vote
        end
      end.to_dmap.should == "mlit\000\000\000\222mikd\000\000\000\001\002asal\000\000\000\bAquariumasar\000\000\000\005Naomimiid\000\000\000\004\000\000\f3minm\000\000\000\016Relax She Saidmper\000\000\000\b}\026}\030\336\367N\324mcti\000\000\000\004\000\000(\222aeHV\000\000\000\001\000asai\000\000\000\b}\026}\030\336\367P\344ceJV\000\000\000\004\000\002\000\000ceJC\000\000\000\001\001"
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