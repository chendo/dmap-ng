TAGS = {
  :abal => ['daap.browsealbumlisting', :list],
  :abar => ['daap.browseartistlisting', :list],
  :abcp => ['daap.browsecomposerlisting', :list],
  :abgn => ['daap.browsegenrelisting', :list],
  :abpl => ['daap.baseplaylist', :byte],
  :abro => ['daap.databasebrowse', :list],
  :adbs => ['daap.databasesongs', :list],
  :aeAI => ['com.apple.itunes.itms-artistid', :integer],
  :aeCI => ['com.apple.itunes.itms-composerid', :integer],
  :aeCR => ['com.apple.itunes.content-rating', :string],
  :aeEN => ['com.apple.itunes.episode-num-str', :string],
  :aeES => ['com.apple.itunes.episode-sort', :integer],
  :aeFP => ['com.apple.itunes.req-fplay', :boolean],
  :aeGU => ['com.apple.itunes.gapless-dur', :long],
  :aeGD => ['com.apple.itunes.gapless-enc-dr', :integer],
  :aeGE => ['com.apple.itunes.gapless-enc-del', :integer],
  :aeGH => ['com.apple.itunes.gapless-heur', :integer],
  :aeGI => ['com.apple.itunes.itms-genreid', :integer],
  :aeGR => ['com.apple.itunes.gapless-resy', :long],
  :aeHD => ['com.apple.itunes.is-hd-video', :boolean],
  :aeHV => ['com.apple.itunes.has-video', :boolean],
  :aeMK => ['com.apple.itunes.mediakind', :boolean],
  :aeNN => ['com.apple.itunes.network-name', :string],
  :aeNV => ['com.apple.itunes.norm-volume', :integer],
  :aePC => ['com.apple.itunes.is-podcast', :boolean],
  :aePI => ['com.apple.itunes.itms-playlistid', :integer],
  :aePP => ['com.apple.itunes.is-podcast-playlist', :boolean],
  :aePS => ['com.apple.itunes.special-playlist', :byte],
  :aeSU => ['com.apple.itunes.season-num', :integer],
  :aeSF => ['com.apple.itunes.itms-storefrontid', :integer],
  :aeSG => ['com.apple.itunes.saved-genius', :boolean],
  :aeSI => ['com.apple.itunes.itms-songid', :integer],
  :aeSN => ['com.apple.itunes.series-name', :string],
  :aeSP => ['com.apple.itunes.smart-playlist', :byte],
  :aeSV => ['com.apple.itunes.music-sharing-version', :version],
  :agrp => ['daap.songgrouping', :string],
  :aply => ['daap.databaseplaylists', :list], 
  :aprm => ['daap.playlistrepeatmode', :byte],
  :apro => ['daap.protocolversion', :version],
  :apsm => ['daap.playlistshufflemode', :byte],
  :apso => ['daap.playlistsongs', :list],
  :arif => ['daap.resolveinfo', :list],
  :arsv => ['daap.resolve', :list],
  :asaa => ['daap.songalbumartist', :string],
  :asai => ['daap.songalbumid', :long],
  :asal => ['daap.songalbum', :string],
  :asar => ['daap.songartist', :string],
  :asbk => ['daap.bookmarkable', :byte],
  :asbo => ['daap.songbookmark', :integer],
  :asbr => ['daap.songbitrate', :short],
  :asbt => ['daap.songbeatsperminute', :short],
  :ascd => ['daap.songcodectype', :integer],
  :ascm => ['daap.songcomment', :string],
  :ascn => ['daap.songcontentdescription', :string],
  :asco => ['daap.songcompilation', :byte],
  :ascp => ['daap.songcomposer', :string],
  :ascr => ['daap.songcontentrating', :byte],
  :ascs => ['daap.songcodecsubtype', :integer],
  :asct => ['daap.songcategory', :string],
  :asda => ['daap.songdateadded', :time],
  :asdb => ['daap.songdisabled', :byte],
  :asdc => ['daap.songdisccount', :short],
  :asdk => ['daap.songdatakind', :byte],
  :asdm => ['daap.songdatemodified', :time],
  :asdn => ['daap.songdiscnumber', :short],
  :asdp => ['daap.songdatepurchased', :time],
  :asdr => ['daap.songdatereleased', :time],
  :asdt => ['daap.songdescription', :string],
  :ased => ['daap.songextradata', :short],
  :aseq => ['daap.songeqpreset', :string],
  :asfm => ['daap.songformat', :string],
  :asgn => ['daap.songgenre', :string],
  :asgp => ['daap.songgapless', :byte],
  :ashp => ['daap.songhasbeenplayed', :byte],
  :asky => ['daap.songkeywords', :string],
  :aslc => ['daap.songlongcontentdescription', :string],
  :asls => ['daap.songlongsize', :long],
  :aspu => ['daap.songpodcasturl', :string],
  :asrv => ['daap.songrelativevolume', :signed_byte],
  :assu => ['daap.sortalbum', :string],
  :assa => ['daap.sortartist', :string],
  :assc => ['daap.sortcomposer', :string],
  :assl => ['daap.sortalbumartist', :string],
  :assn => ['daap.sortname', :string],
  :assp => ['daap.songstoptime', :integer],
  :assr => ['daap.songsamplerate', :integer],
  :asss => ['daap.sortseriesname', :string],
  :asst => ['daap.songstarttime', :integer],
  :assz => ['daap.songsize', :integer],
  :astc => ['daap.songtrackcount', :short],
  :astm => ['daap.songtime', :integer],
  :astn => ['daap.songtracknumber', :short],
  :asul => ['daap.songdataurl', :string],
  :asur => ['daap.songuserrating', :byte],
  :asyr => ['daap.songyear', :short],
  :ated => ['daap.supportsextradata', :short],
  :avdb => ['daap.serverdatabases', :list],
  :ceJC => ['com.apple.itunes.jukebox-client-vote', :signed_byte],
  :ceJI => ['com.apple.itunes.jukebox-current', :integer],
  :ceJS => ['com.apple.itunes.jukebox-score', :signed_short],
  :ceJV => ['com.apple.itunes.jukebox-vote', :short_integer], # Special case, 4 byte integer but data stored in first two bytes
  :ceVO => ['com.apple.itunes.unknown-voting', :boolean],
  :ceWM => ['com.apple.itunes.welcome-message', :string],
  :"f\215ch" => ['dmap.haschildcontainers', :byte],
  :mbcl => ['dmap.bag', :list],
  :mccr => ['dmap.contentcodesresponse', :list],
  :mcna => ['dmap.contentcodesname', :string],
  :mcnm => ['dmap.contentcodesnumber', :integer],
  :mcon => ['dmap.container', :list],
  :mctc => ['dmap.containercount', :integer],
  :mcti => ['dmap.containeritemid', :integer],
  :mcty => ['dmap.contentcodestype', :short],
  :mdcl => ['dmap.dictionary', :list],
  :meds => ['dmap.editcommandssupported', :integer],
  :miid => ['dmap.itemid', :integer],
  :mikd => ['dmap.itemkind', :byte],
  :mimc => ['dmap.itemcount', :integer],
  :minm => ['dmap.itemname', :string],
  :mlcl => ['dmap.listing', :list],
  :mlid => ['dmap.sessionid', :integer],
  :mlit => ['dmap.listingitem', :list],
  :mlog => ['dmap.loginresponse', :list],
  :mpco => ['dmap.parentcontainerid', :integer],
  :mper => ['dmap.persistentid', :long],
  :mpro => ['dmap.protocolversion', :version],
  :mrco => ['dmap.returnedcount', :integer],
  :msau => ['dmap.authenticationmethod', :byte],
  :msal => ['dmap.supportsautologout', :byte],
  :msas => ['dmap.authenticationschemes', :byte],
  :msbr => ['dmap.supportsbrowse', :byte],
  :msdc => ['dmap.databasescount', :integer],
  :msed => ['unknown_msed', :byte], # TODO: Figure out what these are for
  :msex => ['dmap.supportsextensions', :byte],
  :msix => ['dmap.supportsindex', :byte],
  :mslr => ['dmap.loginrequired', :byte],
  :msma => ['unknown_msma', :long],
  :msml => ['unknown_msml', :list],
  :mspi => ['dmap.supportspersistentids', :byte],
  :msqy => ['dmap.supportsquery', :byte],
  :msrs => ['dmap.supportsresolve', :byte],
  :msrv => ['dmap.serverinforesponse', :list],
  :mstc => ['dmap.utctime', :time],
  :mstm => ['dmap.timeoutinterval', :integer],
  :msto => ['dmap.utcoffset', :signed_integer],
  :msts => ['dmap.statusstring', :string],
  :mstt => ['dmap.status', :integer],
  :msup => ['dmap.supportsupdate', :byte],
  :mtco => ['dmap.specifiedtotalcount', :integer],
  :mudl => ['dmap.deletedidlisting', :list],
  :mupd => ['dmap.updateresponse', :list],
  :musr => ['dmap.serverrevision', :integer],
  :muty => ['dmap.updatetype', :byte],
  
  # dacp.availablerepeatstates
  # dacp.availableshufflestates
  # dacp.nowplaying
  # dacp.playerstate
  # dacp.shufflestate
  # dacp.skipincrement
  # dacp.userrating
  # dacp.volumecontrollable
  # dacp.nowplaying
  
  # New tags
  :cmgt => ['unknown.list', :list],
  :cmvo => ['dmcp.volume', :integer], # 0 - 100
  :caci => ['unknown.control_init', :list],
  :cmik => ['unknown', :byte], # 
  :cmsp => ['unknown', :byte], # 
  
  # From /ctrl-int/1/getplayerstatus
  :cmst => ['unknown.list', :list],
  :cmsr => ['unknown.revision', :integer], # Looks like an integer
  :caps => ['dacp.playerstate', :byte], # 3 -> paused, 4 -> playing
  :cash => ['dacp.shufflestate', :boolean],
  :carp => ['dacp.repeatstate', :byte], # 2 -> all, 1 -> single, 0 -> off
  :cavc => ['dacp.volumecontrollable', :boolean], # could be byte
  :caas => ['dacp.availableshufflestates', :integer], # eg 2
  :caar => ['dacp.availablerepeatstates', :integer], # eg 6
  
  :cann => ['dacp.track_name', :string], # name?
  :cana => ['dacp.track_artist', :string], # name?
  :canl => ['dacp.track_album', :string], # name?
  :cang => ['dacp.track_genre', :string], # name?
    
  :cant => ['dacp.playingtime', :integer], # in milliseconds
  :cast => ['dacp.totaltime', :integer],
  
  :canp => ['dacp.nowplaying', :string], # guessing the name
  :cmmk => ['unknown', :integer],
  :ceGS => ['unknown', :byte], # could be boolean same prefix as jukebox stuff further up

  # Interesting strings from iTunes
  # daap.baseplaylist
  # daap.bookmarkable
  # daap.browsealbumlisting
  # daap.browseartistlisting
  # daap.browsecomposerlisting
  # daap.browsegenrelisting
  # daap.databasebrowse
  # daap.databaseplaylists
  # daap.databasesongs
  # daap.playlistrepeatmode
  # daap.playlistshufflemode
  # daap.playlistsongs
  # daap.protocolversion
  # daap.resolve
  # daap.resolveinfo
  # daap.serverdatabases
  # daap.songalbum
  # daap.songalbumartist
  # daap.songalbumid
  # daap.songartist
  # daap.songbeatsperminute
  # daap.songbitrate
  # daap.songbookmark
  # daap.songcategory
  # daap.songcategory,daap.songextradata,daap.songcontentdescription,daap.songlongcontentdescription,daap.songkeywords,com.apple.itunes.is-podcast,com.apple.itunes.mediakind,com.apple.itunes.extended-media-kind,com.apple.itunes.series-name,com.apple.itunes.network-name,com.apple.itunes.episode-num-str,com.apple.itunes.episode-sort,com.apple.itunes.season-num,daap.songgapless,com.apple.itunes.gapless-enc-del,com.apple.itunes.gapless-heur,com.apple.itunes.gapless-enc-dr,com.apple.itunes.gapless-dur,com.apple.itunes.gapless-resy,com.apple.itunes.content-rating
  # daap.songcodecsubtype
  # daap.songcodectype
  # daap.songcomment
  # daap.songcompilation
  # daap.songcomposer
  # daap.songcontentdescription
  # daap.songcontentrating
  # daap.songdatakind
  # daap.songdataurl
  # daap.songdateadded
  # daap.songdatemodified
  # daap.songdatepurchased
  # daap.songdatereleased
  # daap.songdescription
  # daap.songdisabled
  # daap.songdisccount
  # daap.songdiscnumber
  # daap.songeqpreset
  # daap.songextradata
  # daap.songformat
  # daap.songgapless
  # daap.songgenre
  # daap.songgrouping
  # daap.songhasbeenplayed
  # daap.songkeywords
  # daap.songlongcontentdescription
  # daap.songlongsize
  # daap.songpodcasturl
  # daap.songrelativevolume
  # daap.songsamplerate
  # daap.songsize
  # daap.songstarttime
  # daap.songstoptime
  # daap.songtime
  # daap.songtrackcount
  # daap.songtracknumber
  # daap.songuserrating
  # daap.songyear
  # daap.sortalbum
  # daap.sortalbumartist
  # daap.sortartist
  # daap.sortcomposer
  # daap.sortname
  # daap.sortseriesname
  # daap.supportsextradata
  # dacp.availablerepeatstates
  # dacp.availableshufflestates
  # dacp.nowplaying
  # dacp.playerstate
  # dacp.playingtime
  # dacp.repeatstate
  # dacp.shufflestate
  # dacp.skipincrement
  # dacp.userrating
  # dacp.volumecontrollable
  # dmap.authenticationmethod
  # dmap.authenticationschemes
  # dmap.bag
  # dmap.container
  # dmap.containercount
  # dmap.containeritemid
  # dmap.contentcodesname
  # dmap.contentcodesnumber
  # dmap.contentcodesresponse
  # dmap.contentcodestype
  # dmap.databasescount
  # dmap.deletedidlisting
  # dmap.dictionary
  # dmap.editcommandssupported
  # dmap.haschildcontainers
  # dmap.itemcount
  # dmap.itemid
  # dmap.itemid,dmap.itemname,dmap.itemkind,dmap.persistentid,daap.songalbum,daap.songgrouping,daap.songartist,daap.songalbumartist,daap.songbitrate,daap.songbeatsperminute,daap.songcomment,daap.songcodectype,daap.songcodecsubtype,daap.songcompilation,daap.songcomposer,daap.songdateadded,daap.songdatemodified,daap.songdisccount,daap.songdiscnumber,daap.songdisabled,daap.songeqpreset,daap.songformat,daap.songgenre,daap.songdescription,daap.songrelativevolume,daap.songsamplerate,daap.songsize,daap.songstarttime,daap.songstoptime,daap.songtime,daap.songtrackcount,daap.songtracknumber,daap.songuserrating,daap.songyear,daap.songdatakind,daap.songdataurl,daap.songcontentrating,com.apple.itunes.norm-volume,com.apple.itunes.itms-songid,com.apple.itunes.itms-artistid,com.apple.itunes.itms-playlistid,com.apple.itunes.itms-composerid,com.apple.itunes.itms-genreid,com.apple.itunes.itms-storefrontid,com.apple.itunes.has-video
  # dmap.itemkind
  # dmap.itemname
  # dmap.listing
  # dmap.listingitem
  # dmap.loginrequired
  # dmap.loginresponse
  # dmap.parentcontainerid
  # dmap.persistentid
  # dmap.protocolversion
  # dmap.returnedcount
  # dmap.serverinforesponse
  # dmap.serverrevision
  # dmap.sessionid
  # dmap.specifiedtotalcount
  # dmap.status
  # dmap.statusstring
  # dmap.supportsautologout
  # dmap.supportsbrowse
  # dmap.supportsextensions
  # dmap.supportsindex
  # dmap.supportspersistentids
  # dmap.supportsquery
  # dmap.supportsresolve
  # dmap.supportsupdate
  # dmap.timeoutinterval
  # dmap.updateresponse
  # dmap.updatetype
  # dmap.utcoffset
  # dmap.utctime
  # dmcp.volume
  # com.apple.itunes.adam-ids-array
  # com.apple.itunes.albumcoverdisplay
  # com.apple.itunes.atvsettingsview
  # com.apple.itunes.atvsetupview
  # com.apple.itunes.atvstreamsettingsview
  # com.apple.itunes.atvsyncsettingsview
  # com.apple.itunes.audioEditor
  # com.apple.itunes.browsebarview
  # com.apple.itunes.checklistitem
  # com.apple.itunes.columnsdisplay
  # com.apple.itunes.content-rating
  # com.apple.itunes.customwindowview
  # com.apple.itunes.downloadsdisplay
  # com.apple.itunes.drm-key1-id
  # com.apple.itunes.drm-key2-id
  # com.apple.itunes.drm-platform-id
  # com.apple.itunes.drm-user-id
  # com.apple.itunes.drm-versions
  # com.apple.itunes.edittext
  # com.apple.itunes.episode-num-str
  # com.apple.itunes.episode-sort
  # com.apple.itunes.extended-media-kind
  # com.apple.itunes.flashipodsetuphandler
  # com.apple.itunes.flat-chapter-data
  # com.apple.itunes.gapless-dur
  # com.apple.itunes.gapless-enc-del
  # com.apple.itunes.gapless-enc-dr
  # com.apple.itunes.gapless-heur
  # com.apple.itunes.gapless-resy
  # com.apple.itunes.geniusbarview
  # com.apple.itunes.gradientframeview
  # com.apple.itunes.has-chapter-data
  # com.apple.itunes.has-video
  # com.apple.itunes.iPodDiskUsageView
  # com.apple.itunes.inlineedittextview
  # com.apple.itunes.iphonesettingsview
  # com.apple.itunes.iphonesetuphandler
  # com.apple.itunes.ipodsettingsview
  # com.apple.itunes.ipodsetuphandler
  # com.apple.itunes.ipodshufflesettingsview
  # com.apple.itunes.is-hd-video
  # com.apple.itunes.is-podcast
  # com.apple.itunes.is-podcast-playlist
  # com.apple.itunes.itms-artistid
  # com.apple.itunes.itms-composerid
  # com.apple.itunes.itms-genreid
  # com.apple.itunes.itms-playlistid
  # com.apple.itunes.itms-songid
  # com.apple.itunes.itms-storefrontid
  # com.apple.itunes.jukebox-client-vote
  # com.apple.itunes.jukebox-current
  # com.apple.itunes.jukebox-score
  # com.apple.itunes.jukebox-vote
  # com.apple.itunes.lock_sync
  # com.apple.itunes.mediakind
  # com.apple.itunes.movielistitem
  # com.apple.itunes.music-sharing-version
  # com.apple.itunes.musicstoredisplay
  # com.apple.itunes.network-name
  # com.apple.itunes.non-drm-user-id
  # com.apple.itunes.norm-volume
  # com.apple.itunes.phonesettingsview
  # com.apple.itunes.pictureanimationview
  # com.apple.itunes.radiobutton
  # com.apple.itunes.req-fplay
  # com.apple.itunes.ringtoneeditorview
  # com.apple.itunes.saved-genius
  # com.apple.itunes.season-num
  # com.apple.itunes.series-name
  # com.apple.itunes.simplelistitem
  # com.apple.itunes.smart-playlist
  # com.apple.itunes.sourcedisplay
  # com.apple.itunes.special-playlist
  # com.apple.itunes.springboardworkaround
  # com.apple.itunes.store-pers-id
  # com.apple.itunes.storebrowsedisplay
  # com.apple.itunes.storeprescienceview
  # com.apple.itunes.storeview
  # com.apple.itunes.summaryitemview
  # com.apple.itunes.syncing
  # com.apple.itunes.touchremotesetupview
  # com.apple.itunes.trackdisplay
  # com.apple.itunes.trackgroupdisplay
  # com.apple.itunes.visualizerview

}

STATIC_LENGTH_TYPES = {
  :boolean => [1, 'C'],
  :byte => [1, 'C'],
  :signed_byte => [1, 'c'],
  :short => [2, 'n'],
  :signed_short => [2, 's'],
  :integer => [4, 'N'],
  :signed_integer => [4, 'l'],
  :long => [8, 'Q'],
  :signed_long => [8, 'q'],
  :version => [4, 'CCCC'],
  :time => [4, 'N'],

  :short_integer => [4, 'nxx'],
}