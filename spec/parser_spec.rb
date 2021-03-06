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
      it "parses mlit (playlist entry)" do
        DMAP.parse("mlit\000\000\000\222mikd\000\000\000\001\002asal\000\000\000\bAquariumasar\000\000\000\005Naomimiid\000\000\000\004\000\000\f3minm\000\000\000\016Relax She Saidmper\000\000\000\b}\026}\030\336\367N\324mcti\000\000\000\004\000\000(\222aeHV\000\000\000\001\000asai\000\000\000\b}\026}\030\336\367P\344ceJV\000\000\000\004\000\002\000\000ceJC\000\000\000\001\001").should == DMAP.build do
          
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
          
        end
        
      end
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
      
      it "parses cmst (player status)" do
        DMAP.parse("cmst\000\000\001%mstt\000\000\000\004\000\000\000\310cmsr\000\000\000\004\000\000\000'caps\000\000\000\001\003cash\000\000\000\001\000carp\000\000\000\001\000cavc\000\000\000\001\001caas\000\000\000\004\000\000\000\002caar\000\000\000\004\000\000\000\006canp\000\000\000\020\000\000\000'\000\000(F\000\000(\266\000\000\016\375cann\000\000\000/Who Needs Forever? (Thievery Corporation remix)cana\000\000\000\017Astrud Gilbertocanl\000\000\000\rVerve Remixedcang\000\000\000\021Electronica/Danceasai\000\000\000\b}\026}\030\336\367Q\035cmmk\000\000\000\004\000\000\000\001ceGS\000\000\000\001\001cant\000\000\000\004\000\002 Gcast\000\000\000\004\000\003\335\024").should == DMAP.build do
          cmst do
            mstt 200 # Status
            cmsr 39 # Revision
            caps 3 # Player state
            cash 0 # Shuffle state
            carp 0 # Repeat state
            cavc 1 # Volume controllable
            caas 2 # Avaliable shuffle states
            caar 6 # Avaliable repeat states
            canp "\000\000\000'\000\000(F\000\000(\266\000\000\016\375" # ??
            cann "Who Needs Forever? (Thievery Corporation remix)" # Track name
            cana "Astrud Gilberto" # Track artist
            canl "Verve Remixed" # Track album
            cang "Electronica/Dance" # Track genre
            asai 9013529250002063645 # ??
            cmmk 1 # ??
            ceGS 1 # ?? something to do with DJ
            cant 139335 # elapsed play time in milliseconds
            cast 253204 # total play time in milliseconds
          end
        end
      end
    end
  end
end