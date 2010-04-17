require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'dmap'

# Time to add your specs!
# http://rspec.info/
describe DMAP do
  describe ".build" do
    it "builds correctly" do
      server_info = DMAP.build do
        msrv do
          mstt 200 # Status
          mpro(0,2,0,6) # DMAP protocol version
          apro(0,3,0,8) # DAAP protocol version
          aeSV(0,3,0,1) # iTunes sharing version
          aeFP true # ??
          ated 3 # ??, 3 in euphony
          msed false # ??, true in euphony
          msml do # Magic fucking numbers.
            msma 224677167504896 # euphony has 71359108752128
            msma 219298093276928 # euphony has 1102738509824
            msma 183156896570880 #euphony has 8799319904256
          end
          ceWM 'sup' # Welcome message
          ceVO true # Voting?
          minm "chendo\342\200\231s Library" # Server name
          mslr true # ??
          mstm 1800 # Timeout
          msal true # ??
          msas 3 # ??
          msup true # ??
          mspi true # ??
          msex true # ??
          msbr true # ??
          msqy true # ??
          msix true # ??
          msrs true # ??
          msdc 1 # Database count?
          
          mstc Time.at(1271418369) # Current time
          msto 36000 # UTC Offset
        end
      end
   
      server_info.to_dmap.should == "msrv\000\000\001<mstt\000\000\000\004\000\000\000\310mpro\000\000\000\004\000\002\000\006apro\000\000\000\004\000\003\000\baeSV\000\000\000\004\000\003\000\001aeFP\000\000\000\001\001ated\000\000\000\002\000\003msed\000\000\000\001\000msml\000\000\0000msma\000\000\000\b\000\000\314W\272\302\036\000msma\000\000\000\b\000\000\307sP\363\037\000msma\000\000\000\b\000\000\246\224\211\302\036\000ceWM\000\000\000\003supceVO\000\000\000\001\001minm\000\000\000\022chendo\342\200\231s Librarymslr\000\000\000\001\001mstm\000\000\000\004\000\000\a\bmsal\000\000\000\001\001msas\000\000\000\001\003msup\000\000\000\001\001mspi\000\000\000\001\001msex\000\000\000\001\001msbr\000\000\000\001\001msqy\000\000\000\001\001msix\000\000\000\001\001msrs\000\000\000\001\001msdc\000\000\000\004\000\000\000\001mstc\000\000\000\004K\310N\001msto\000\000\000\004\000\000\214\240"
    end
  end
  
  describe ".parse" do
    it "parses server info data" do
      expected = DMAP.build do
        msrv do
          mstt 200 # Status
          mpro(0,2,0,6) # DMAP protocol version
          apro(0,3,0,8) # DAAP protocol version
          aeSV(0,3,0,1) # iTunes sharing version
          aeFP true # ??
          ated 3 # ??, 3 in euphony
          msed false # ??, true in euphony
          msml do # Magic fucking numbers.
            msma 224677167504896 # euphony has 71359108752128
            msma 219298093276928 # euphony has 1102738509824
            msma 183156896570880 #euphony has 8799319904256
          end
          ceWM 'sup' # Welcome message
          ceVO true # Voting?
          minm "chendo\342\200\231s Library" # Server name
          mslr true # ??
          mstm 1800 # Timeout
          msal true # ??
          msas 3 # ??
          msup true # ??
          mspi true # ??
          msex true # ??
          msbr true # ??
          msqy true # ??
          msix true # ??
          msrs true # ??
          msdc 1 # Database count?
          
          mstc Time.at(1271418369) # Current time
          msto 36000 # UTC Offset
        end
      end
    
      expected.should == DMAP.parse("msrv\000\000\001<mstt\000\000\000\004\000\000\000\310mpro\000\000\000\004\000\002\000\006apro\000\000\000\004\000\003\000\baeSV\000\000\000\004\000\003\000\001aeFP\000\000\000\001\001ated\000\000\000\002\000\003msed\000\000\000\001\000msml\000\000\0000msma\000\000\000\b\000\000\314W\272\302\036\000msma\000\000\000\b\000\000\307sP\363\037\000msma\000\000\000\b\000\000\246\224\211\302\036\000ceWM\000\000\000\003supceVO\000\000\000\001\001minm\000\000\000\022chendo\342\200\231s Librarymslr\000\000\000\001\001mstm\000\000\000\004\000\000\a\bmsal\000\000\000\001\001msas\000\000\000\001\003msup\000\000\000\001\001mspi\000\000\000\001\001msex\000\000\000\001\001msbr\000\000\000\001\001msqy\000\000\000\001\001msix\000\000\000\001\001msrs\000\000\000\001\001msdc\000\000\000\004\000\000\000\001mstc\000\000\000\004K\310N\001msto\000\000\000\004\000\000\214\240")
    end
  end
end
