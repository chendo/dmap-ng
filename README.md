# dmap-ng

dmap-ng is an improved version of the original dmap gem, rewritten from the ground up with a more detailed test suite and has awesome features like a DSL and supports a more extensive part of the DMAP protocol.

## What is DMAP?

DMAP stands for Digital Media Access Protocol which is the data serialisation format used in the [DAAP](http://en.wikipedia.org/wiki/Digital_Audio_Access_Protocol) protocol mainly used in iTunes for media sharing and remote control.

## Why should I care?

You should care if you want to write anything that interacts with iTunes/DAAP-compatible media server or a DAAP client.

## What this currently being used for

I wanted to write a gem that emulates an iTunes DJ server so the Remote.app on the iPhone/iTouch/iPad can interface with any app that has voting, so it was my Railscamp 7 project. I wrote this gem over the two days at Railscamp, using the tag list from jphasting's dmap gem but writing everything from scratch. It has enough tag support to get the Remote.app to show arbitrary data with the gem I'll upload once it's in a decent state named 'deejay'.

## How to use

Real easy. Check this out:

This is a aply (playlists) entry.

    playlists = DMAP.parse("aply\000\000\001\nmstt\000\000\000\004\000\000\000\310muty\000\000\000\001\000mtco\000\000\000\004\000\000\000\002mrco\000\000\000\004\000\000\000\002mlcl\000\000\000\325mlit\000\000\000_miid\000\000\000\004\000\000(Fmper\000\000\000\b\000\000\000\000\000\000\000{minm\000\000\000\005MusicaeSP\000\000\000\001\001mpco\000\000\000\004\000\000\000\000aePS\000\000\000\001\006meds\000\000\000\004\000\000\000\000mimc\000\000\000\004\000\000\000\002mlit\000\000\000fmiid\000\000\000\004\000\000()mper\000\000\000\b\000\000\000\000\000\000\004\322minm\000\000\000\tiTunes DJmpco\000\000\000\004\000\000\000\000aePS\000\000\000\001\002meds\000\000\000\004\000\000\000\000ceJI\000\000\000\004\000\000(,mimc\000\000\000\004\000\000\000\022")
    
would return:

    aply[266]:
      mstt[4]: 200
      muty[1]: 0
      mtco[4]: 2
      mrco[4]: 2
      mlcl[213]:
        mlit[95]:
          miid[4]: 10310
          mper[8]: 123
          minm[5]: "Music"
          aeSP[1]: true
          mpco[4]: 0
          aePS[1]: 6
          meds[4]: 0
          mimc[4]: 2
        mlit[102]:
          miid[4]: 10281
          mper[8]: 1234
          minm[9]: "iTunes DJ"
          mpco[4]: 0
          aePS[1]: 2
          meds[4]: 0
          ceJI[4]: 10284
          mimc[4]: 18

      
      
Which is a `DMAP::Tag` object. You can access individual tags like this:

    playlists.mstt # => 200
    playlists.mlcl[1].minm # => "iTunes DJ"

To build a DMAP structure, you do this:

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
    end
    
There is also a `#to_dsl` method on DMAP::Tag that returns a copy-pasta-able ruby code that goes inside the `DMAP.build` block.

    puts playlists.to_dsl
    
which gives you this:
    
    aply do # daap.databaseplaylists
      mstt 200 # dmap.status
      muty 0 # dmap.updatetype
      mtco 2 # dmap.specifiedtotalcount
      mrco 2 # dmap.returnedcount
      mlcl do # dmap.listing
        mlit do # dmap.listingitem
          miid 10310 # dmap.itemid
          mper 123 # dmap.persistentid
          minm "Music" # dmap.itemname
          aeSP true # com.apple.itunes.smart-playlist
          mpco 0 # dmap.parentcontainerid
          aePS 6 # com.apple.itunes.special-playlist
          meds 0 # dmap.editcommandssupported
          mimc 2 # dmap.itemcount
        end
        mlit do # dmap.listingitem
          miid 10281 # dmap.itemid
          mper 1234 # dmap.persistentid
          minm "iTunes DJ" # dmap.itemname
          mpco 0 # dmap.parentcontainerid
          aePS 2 # com.apple.itunes.special-playlist
          meds 0 # dmap.editcommandssupported
          ceJI 10284 # com.apple.itunes.jukebox-current
          mimc 18 # dmap.itemcount
        end
      end
    end
    
As you can see, it also puts in the tag definition at the end because I got tired of having to look up what a tag actually was.

Also, there is a `dmap` executable that lets you pipe DMAP data to it and it'll give you a `DMAP::Tag#inspect` output. Example usage:

    $ curl A "Remote/1.3.3" -H "Special-Client: 2" "http://localhost:3689/server-info" | dmap 
    msrv[316]: dmap.serverinforesponse
      mstt[4]: 200 - dmap.status
      mpro[4]: [0, 2, 0, 6] - dmap.protocolversion
      apro[4]: [0, 3, 0, 8] - daap.protocolversion
      aeSV[4]: [0, 3, 0, 1] - com.apple.itunes.music-sharing-version
      aeFP[1]: 1 - com.apple.itunes.req-fplay
      ated[2]: 3 - daap.supportsextradata
      msed[1]: 0 - unknown_msed
      msml[48]: unknown_msml
        msma[8]: <censored until I know what this does>
        msma[8]: <censored until I know what this does>
        msma[8]: <censored until I know what this does>
      ceWM[3]: "sup" - com.apple.itunes.welcome-message
      ceVO[1]: 1 - com.apple.itunes.unknown-voting
      minm[18]: "chendo\342\200\231s Library" - dmap.itemname
      mslr[1]: 1 - dmap.loginrequired
      mstm[4]: 1800 - dmap.timeoutinterval
      msal[1]: 1 - dmap.supportsautologout
      msas[1]: 3 - dmap.authenticationschemes
      msup[1]: 1 - dmap.supportsupdate
      mspi[1]: 1 - dmap.supportspersistentids
      msex[1]: 1 - dmap.supportsextensions
      msbr[1]: 1 - dmap.supportsbrowse
      msqy[1]: 1 - dmap.supportsquery
      msix[1]: 1 - dmap.supportsindex
      msrs[1]: 1 - dmap.supportsresolve
      msdc[4]: 1 - dmap.databasescount
      mstc[4]: 1271654695 - dmap.utctime
      msto[4]: 36000 - dmap.utcoffset
      
Or if you've saved the bytes to a file with Wireshark or something:

    $ dmap file.dump
    $ cat file.dump | dmap
    $ dmap < file.dump

## Come across a new tag?

Send me an email with a pcap dump of the entire process and I'll see what I can do.
    
## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Jack "chendo" Chen. See LICENSE for details.
